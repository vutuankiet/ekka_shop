package com.example.ekka.service;

import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.ProductDto;
import com.example.ekka.entities.*;
import com.example.ekka.helper.GenKey;
import com.example.ekka.repository.bill.BillRepository;
import com.example.ekka.repository.cart.CartRepository;
import com.example.ekka.repository.order.OrderRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.service.email.EmailDetails;
import com.example.ekka.service.email.EmailService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    @Autowired
    ProductService productService;

    @Autowired
    EmailService emailService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    CartRepository cartRepository;

    @Autowired
    BillRepository billRepository;

    public List<OrderEntity> listAll() {
        return (List<OrderEntity>) orderRepository.findAll();
    }

    public List<OrderEntity> findByUser(String code) {
        return (List<OrderEntity>) orderRepository.findAllByOrder_code(code);
    }

    public List<OrderEntity> findByUserId(long id) {
        return (List<OrderEntity>) orderRepository.findAllByUserId(id);
    }

    public List<OrderEntity> listAllDelivered() {
        return (List<OrderEntity>) orderRepository.findAllByDelivered();
    }
    public int countAllDelivered() {
        return orderRepository.countOrderDelivered();
    }
    public int countAll() {
        return orderRepository.countAll();
    }

    public List<OrderEntity> findAllByUpdateDesc() {
        return (List<OrderEntity>) orderRepository.findAllByUpdate_at();
    }

    public void changeState0(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState0(orderDto.getOrder_code());
            billRepository.changeState0(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }

        EmailDetails emailDetails = new EmailDetails();
        emailDetails.setRecipient(orderDto.getEmail());
        emailDetails.setSubject("[THÔNG BÁO - EKKA SHOP]ĐƠN HÀNG MÃ SỐ #" + orderDto.getOrder_code() + " ĐÃ BỊ HỦY");
        emailDetails.setMsgBody(String.format("Thư thông báo trạng thái đơn hàng:\n" +
                "Vào đường link http://localhost:8080/ekka/history để xem lịch sử đơn hàng đã đặt!"));
        emailService.sendSimpleMail(emailDetails);
    }

    public void changeState1(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState1(orderDto.getOrder_code());
            billRepository.changeState1(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }

        EmailDetails emailDetails = new EmailDetails();
        emailDetails.setRecipient(orderDto.getEmail());
        emailDetails.setSubject("[THÔNG BÁO - EKKA SHOP]ĐƠN HÀNG MÃ SỐ #" + orderDto.getOrder_code() + " ĐÃ VÀO TRẠNG THÁI CHỜ");
        emailDetails.setMsgBody(String.format("Thư thông báo trạng thái đơn hàng:\n" +
                "Vào đường link http://localhost:8080/ekka/history/"+orderDto.getOrder_code()+" để xem lịch sử đơn hàng đã đặt!"));
        emailService.sendSimpleMail(emailDetails);
    }

    public void changeState2(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState2(orderDto.getOrder_code());
            billRepository.changeState2(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }

        EmailDetails emailDetails = new EmailDetails();
        emailDetails.setRecipient(orderDto.getEmail());
        emailDetails.setSubject("[THÔNG BÁO - EKKA SHOP]ĐƠN HÀNG MÃ SỐ #" + orderDto.getOrder_code() + " ĐÃ VÀO TRẠNG THÁI SẴN SÀNG");
        emailDetails.setMsgBody(String.format("Thư thông báo trạng thái đơn hàng:\n" +
                "Vào đường link http://localhost:8080/ekka/history"+orderDto.getOrder_code()+" để xem lịch sử đơn hàng đã đặt!"));
        emailService.sendSimpleMail(emailDetails);
    }

    public void changeState3(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState3(orderDto.getOrder_code());
            billRepository.changeState3(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }

        List<OrderEntity> listOrder = getOrderByUserId(orderDto.getOrder_code(), orderDto.getIdUser());
        try {
            String[] address = {};
            String[] name = {};
            String[] phone = {};
            String[] create = {};
            List listDeliveryAddress = new ArrayList<>(Arrays.asList(address));
            List listNameConsignee = new ArrayList<>(Arrays.asList(name));
            List listDeliveryPhone = new ArrayList<>(Arrays.asList(phone));
            List listCreate = new ArrayList<>(Arrays.asList(create));
            for (OrderEntity order : listOrder) {
                listDeliveryAddress.add(order.getDelivery_address());
                listNameConsignee.add(order.getName_consignee());
                listDeliveryPhone.add(order.getDelivery_phone());
                listCreate.add(order.getCreated_at());

            }

            double total = 0;
            for (OrderEntity order : listOrder) {
                double price = Double.parseDouble(order.getPrice());
                total = total + price;
            }
            double totalPrice = (double) Math.round(total*100)/100;
            String delivery_address = (String) listDeliveryAddress.get(0);
            String name_consignee = (String) listNameConsignee.get(0);
            String delivery_phone = (String) listDeliveryPhone.get(0);
            Timestamp created_at = (Timestamp) listCreate.get(0);

            Timestamp timestamp = new Timestamp(created_at.getTime()+(86400000*5));

            String outTime = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss").format(timestamp);

            String createOrder = new SimpleDateFormat("dd/MM/yyyy").format(created_at);

            EmailDetails emailDetails = new EmailDetails();
            emailDetails.setRecipient(orderDto.getEmail());
            emailDetails.setSubject("[THÔNG BÁO - EKKA SHOP]ĐƠN HÀNG MÃ SỐ #" + orderDto.getOrder_code() + " ĐÃ VÀO TRẠNG THÁI VẬN CHUYỂN");
            emailDetails.setMsgBody("<!DOCTYPE HTML\n" +
                    "  PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
                    "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"\n" +
                    "  xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n" +
                    "\n" +
                    "<head>\n" +
                    "  <!--[if gte mso 9]>\n" +
                    "<xml>\n" +
                    "  <o:OfficeDocumentSettings>\n" +
                    "    <o:AllowPNG/>\n" +
                    "    <o:PixelsPerInch>96</o:PixelsPerInch>\n" +
                    "  </o:OfficeDocumentSettings>\n" +
                    "</xml>\n" +
                    "<![endif]-->\n" +
                    "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                    "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                    "  <meta name=\"x-apple-disable-message-reformatting\">\n" +
                    "  <!--[if !mso]><!-->\n" +
                    "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                    "  <!--<![endif]-->\n" +
                    "  <title></title>\n" +
                    "\n" +
                    "  <style type=\"text/css\">\n" +
                    "    @media only screen and (min-width: 570px) {\n" +
                    "      .u-row {\n" +
                    "        width: 550px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col {\n" +
                    "        vertical-align: top;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-24p79 {\n" +
                    "        width: 136.345px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-25 {\n" +
                    "        width: 137.5px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-33p33 {\n" +
                    "        width: 183.315px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-41p88 {\n" +
                    "        width: 230.34px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-50 {\n" +
                    "        width: 275px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-100 {\n" +
                    "        width: 550px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "    }\n" +
                    "\n" +
                    "    @media (max-width: 570px) {\n" +
                    "      .u-row-container {\n" +
                    "        max-width: 100% !important;\n" +
                    "        padding-left: 0px !important;\n" +
                    "        padding-right: 0px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col {\n" +
                    "        min-width: 320px !important;\n" +
                    "        max-width: 100% !important;\n" +
                    "        display: block !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row {\n" +
                    "        width: calc(100% - 40px) !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-col {\n" +
                    "        width: 100% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-col>div {\n" +
                    "        margin: 0 auto;\n" +
                    "      }\n" +
                    "    }\n" +
                    "\n" +
                    "    body {\n" +
                    "      margin: 0;\n" +
                    "      padding: 0;\n" +
                    "    }\n" +
                    "\n" +
                    "    table,\n" +
                    "    tr,\n" +
                    "    td {\n" +
                    "      vertical-align: top;\n" +
                    "      border-collapse: collapse;\n" +
                    "    }\n" +
                    "\n" +
                    "    p {\n" +
                    "      margin: 0;\n" +
                    "    }\n" +
                    "\n" +
                    "    .ie-container table,\n" +
                    "    .mso-container table {\n" +
                    "      table-layout: fixed;\n" +
                    "    }\n" +
                    "\n" +
                    "    * {\n" +
                    "      line-height: inherit;\n" +
                    "    }\n" +
                    "\n" +
                    "    a[x-apple-data-detectors='true'] {\n" +
                    "      color: inherit !important;\n" +
                    "      text-decoration: none !important;\n" +
                    "    }\n" +
                    "\n" +
                    "    @media (max-width: 480px) {\n" +
                    "      .hide-mobile {\n" +
                    "        max-height: 0px;\n" +
                    "        overflow: hidden;\n" +
                    "        display: none !important;\n" +
                    "      }\n" +
                    "    }\n" +
                    "\n" +
                    "    table,\n" +
                    "    td {\n" +
                    "      color: #000000;\n" +
                    "    }\n" +
                    "\n" +
                    "    #u_body a {\n" +
                    "      color: #0000ee;\n" +
                    "      text-decoration: underline;\n" +
                    "    }\n" +
                    "\n" +
                    "    @media (max-width: 480px) {\n" +
                    "      #u_content_text_4 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 10px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_2 .v-container-padding-padding {\n" +
                    "        padding: 10px 10px 15px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_5 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_5 .v-src-width {\n" +
                    "        width: auto !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_5 .v-src-max-width {\n" +
                    "        max-width: 52% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_4 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_4 .v-src-width {\n" +
                    "        width: auto !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_4 .v-src-max-width {\n" +
                    "        max-width: 52% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_3 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_3 .v-src-width {\n" +
                    "        width: auto !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_3 .v-src-max-width {\n" +
                    "        max-width: 52% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_17 .v-container-padding-padding {\n" +
                    "        padding: 10px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_17 .v-text-align {\n" +
                    "        text-align: center !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_5 .v-container-padding-padding {\n" +
                    "        padding: 10px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_2 .v-container-padding-padding {\n" +
                    "        padding: 10px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_2 .v-text-align {\n" +
                    "        text-align: center !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_2 .v-padding {\n" +
                    "        padding: 12px 55px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_1 .v-text-align {\n" +
                    "        text-align: center !important;\n" +
                    "      }\n" +
                    "    }\n" +
                    "  </style>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "  <!--[if !mso]><!-->\n" +
                    "  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\">\n" +
                    "  <link href=\"https://fonts.googleapis.com/css?family=Raleway:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\">\n" +
                    "  <!--<![endif]-->\n" +
                    "\n" +
                    "</head>\n" +
                    "\n" +
                    "<body class=\"clean-body u_body\"\n" +
                    "  style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #ffffff;color: #000000\">\n" +
                    "  <!--[if IE]><div class=\"ie-container\"><![endif]-->\n" +
                    "  <!--[if mso]><div class=\"mso-container\"><![endif]-->\n" +
                    "  <table id=\"u_body\"\n" +
                    "    style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #ffffff;width:100%\"\n" +
                    "    cellpadding=\"0\" cellspacing=\"0\">\n" +
                    "    <tbody>\n" +
                    "      <tr style=\"vertical-align: top\">\n" +
                    "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "          <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #ffffff;\"><![endif]-->\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:20px 10px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                    "                                <tr>\n" +
                    "                                  <td class=\"v-text-align\" style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
                    "\n" +
                    "                                    <img align=\"center\" border=\"0\" src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-4.png?alt=media&token=dd3feaff-d148-4546-b9d6-f9b6dc894668\" alt=\"Logo\" title=\"Logo\"\n" +
                    "                                      style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 33%;max-width: 174.9px;\"\n" +
                    "                                      width=\"174.9\" class=\"v-src-width v-src-max-width\" />\n" +
                    "\n" +
                    "                                  </td>\n" +
                    "                                </tr>\n" +
                    "                              </table>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #eccafa;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #eccafa;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                    "                                <tr>\n" +
                    "                                  <td class=\"v-text-align\" style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
                    "\n" +
                    "                                    <img align=\"center\" border=\"0\" src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-5.jpeg?alt=media&token=77a345e8-0398-42c9-9753-316e4e30915a\" alt=\"Invoice Banner\"\n" +
                    "                                      title=\"Invoice Banner\"\n" +
                    "                                      style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\"\n" +
                    "                                      width=\"550\" class=\"v-src-width v-src-max-width\" />\n" +
                    "\n" +
                    "                                  </td>\n" +
                    "                                </tr>\n" +
                    "                              </table>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #f5dcfc;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #f5dcfc;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:20px 10px 0px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <h1 class=\"v-text-align\"\n" +
                    "                                style=\"margin: 0px; color: #272e79; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-family: 'Raleway',sans-serif; font-size: 22px;\">\n" +
                    "                                Dear ["+name_consignee+"],\n" +
                    "                              </h1>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 10px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #333333; line-height: 150%; text-align: left; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Shipping\n" +
                    "                                    Details:</strong><br /><strong>Order Number:</strong> "+orderDto.getOrder_code()+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><br /><strong>Delivered-to:</strong>\n" +
                    "                                  "+name_consignee+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Email:</strong> "+orderDto.getEmail()+"\n" +
                    "                                </p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Phone:</strong> "+delivery_phone+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Address:</strong> "+delivery_address+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><br /><strong>Date Dispatched:</strong> "+createOrder+"</p><br>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>(*) A small note:</strong> Be sure to check your phone for the parcel and double-check the package information before receiving the goods.</p>\n"+
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>(*) Please prepare $"+totalPrice+" to pay, <a href=\"http://localhost:8080/ekka/history/"+orderDto.getOrder_code()+"\">see details here<a>.</strong></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #f5dcfc;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #f5dcfc;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px 10px 10px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #333333; line-height: 150%; text-align: left; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%; text-align: center;\"><span\n" +
                    "                                    style=\"font-size: 20px; line-height: 30px;\"><strong>Thank You for being with\n" +
                    "                                      Us!</strong></span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px 10px 30px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #333333; line-height: 150%; text-align: left; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong><span\n" +
                    "                                      style=\"font-size: 16px; line-height: 24px;\">Best Wishes,</span></strong></p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><span\n" +
                    "                                    style=\"font-size: 16px; line-height: 24px;\"><span\n" +
                    "                                      style=\"color: #3598db; font-size: 16px; line-height: 24px;\"><strong>EKKA\n" +
                    "                                        SHOP</strong></span> </span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n" +
                    "                                style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                    "                                <tbody>\n" +
                    "                                  <tr style=\"vertical-align: top\">\n" +
                    "                                    <td\n" +
                    "                                      style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                    "                                      <span>&#160;</span>\n" +
                    "                                    </td>\n" +
                    "                                  </tr>\n" +
                    "                                </tbody>\n" +
                    "                              </table>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-image: url('https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-8.png?alt=media&token=f10f46b6-dd11-4d33-8d8d-819856fb9b11');background-repeat: no-repeat;background-position: center top;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-image: url('https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-8.png?alt=media&token=f10f46b6-dd11-4d33-8d8d-819856fb9b11');background-repeat: no-repeat;background-position: center top;background-color: transparent;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"275\" style=\"width: 275px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-50\"\n" +
                    "                  style=\"max-width: 320px;min-width: 275px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table id=\"u_content_button_2\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\"\n" +
                    "                        cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 40px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->\n" +
                    "                              <div class=\"v-text-align\" align=\"right\">\n" +
                    "                                <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:40px; v-text-anchor:middle; width:157px;\" arcsize=\"32.5%\"  stroke=\"f\" fillcolor=\"#76388b\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:'Raleway',sans-serif;\"><![endif]-->\n" +
                    "                                <a href=\"http://localhost:8080/ekka/product\" target=\"_blank\" class=\"v-button\"\n" +
                    "                                  style=\"box-sizing: border-box;display: inline-block;font-family:'Raleway',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #76388b; border-radius: 13px;-webkit-border-radius: 13px; -moz-border-radius: 13px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">\n" +
                    "                                  <span class=\"v-padding\"\n" +
                    "                                    style=\"display:block;padding:12px 50px;line-height:120%;\"><span\n" +
                    "                                      style=\"font-size: 14px; line-height: 16.8px;\">SHOPPING NOW!</span></span>\n" +
                    "                                </a>\n" +
                    "                                <!--[if mso]></center></v:roundrect><![endif]-->\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"275\" style=\"width: 275px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-50\"\n" +
                    "                  style=\"max-width: 320px;min-width: 275px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table id=\"u_content_button_1\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\"\n" +
                    "                        cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 40px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->\n" +
                    "                              <div class=\"v-text-align\" align=\"left\">\n" +
                    "                                <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:40px; v-text-anchor:middle; width:166px;\" arcsize=\"32.5%\"  stroke=\"f\" fillcolor=\"#76388b\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:'Raleway',sans-serif;\"><![endif]-->\n" +
                    "                                <a href=\"http://localhost:8080/ekka/history/"+orderDto.getOrder_code()+"\" target=\"_blank\" class=\"v-button\"\n" +
                    "                                  style=\"box-sizing: border-box;display: inline-block;font-family:'Raleway',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #76388b; border-radius: 13px;-webkit-border-radius: 13px; -moz-border-radius: 13px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">\n" +
                    "                                  <span class=\"v-padding\"\n" +
                    "                                    style=\"display:block;padding:12px 25px;line-height:120%;\"><span\n" +
                    "                                      style=\"font-size: 14px; line-height: 16.8px;\">GO INVOICE NOW!</span></span>\n" +
                    "                                </a>\n" +
                    "                                <!--[if mso]></center></v:roundrect><![endif]-->\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #1f2060;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #1f2060;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:35px 10px 10px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div align=\"center\">\n" +
                    "                                <div style=\"display: table; max-width:171px;\">\n" +
                    "                                  <!--[if (mso)|(IE)]><table width=\"171\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"border-collapse:collapse;\" align=\"center\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:171px;\"><tr><![endif]-->\n" +
                    "\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 11px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 11px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://facebook.com/\" title=\"Facebook\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-3.png?alt=media&token=2d3b9a22-c044-40f3-8226-13551f159047\" alt=\"Facebook\" title=\"Facebook\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 11px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 11px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://twitter.com/\" title=\"Twitter\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-2.png?alt=media&token=d1f8cff6-5d44-4f44-9961-8d7cae58c642\" alt=\"Twitter\" title=\"Twitter\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 11px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 11px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://linkedin.com/\" title=\"LinkedIn\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-6.png?alt=media&token=33212ffd-2153-4f8e-be09-0c71acf26513\" alt=\"LinkedIn\" title=\"LinkedIn\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 0px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 0px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://instagram.com/\" title=\"Instagram\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-1.png?alt=media&token=290a27e3-f7ef-41ba-b187-2e675e2bb683\" alt=\"Instagram\" title=\"Instagram\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "                                </div>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 30px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                    "                                    style=\"font-size: 12px; line-height: 16.8px;\">Lorem ipsum is a placeholder text\n" +
                    "                                    commonly used to demonstrate the visual form of a document or a typeface without\n" +
                    "                                  </span><span style=\"font-size: 12px; line-height: 16.8px;\">relying on meaningful\n" +
                    "                                    content. </span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 30px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                    "                                    style=\"font-size: 12px; line-height: 16.8px;\">&copy; Copyright 20XX. Your Brand All\n" +
                    "                                    Rights Reserved.</span></p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                    "                                    style=\"text-decoration: underline; font-size: 14px; line-height: 19.6px;\"><span\n" +
                    "                                      style=\"font-size: 12px; line-height: 16.8px;\">Unsubscribe </span></span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n" +
                    "        </td>\n" +
                    "      </tr>\n" +
                    "    </tbody>\n" +
                    "  </table>\n" +
                    "  <!--[if mso]></div><![endif]-->\n" +
                    "  <!--[if IE]></div><![endif]-->\n" +
                    "</body>\n" +
                    "\n" +
                    "</html>");
            emailService.sendMailWithAttachment(emailDetails);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public void changeState4(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState4(orderDto.getOrder_code());
            billRepository.changeState4(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }

        EmailDetails emailDetails = new EmailDetails();
        emailDetails.setRecipient(orderDto.getEmail());
        emailDetails.setSubject("[THÔNG BÁO - EKKA SHOP]ĐƠN HÀNG MÃ SỐ #" + orderDto.getOrder_code() + " ĐÃ ĐƯỢC GIAO THÀNH CÔNG");
        emailDetails.setMsgBody(String.format("Thư thông báo trạng thái đơn hàng:\n"+"Vào đường link http://localhost:8080/ekka/history"+orderDto.getOrder_code()+" để xem lịch sử đơn hàng đã đặt!\n" + "Cảm ơn bạn đã mua hàng tại EKKA shop"));
        emailService.sendSimpleMail(emailDetails);
    }

    public List<OrderEntity> get(String code) {
        return (List<OrderEntity>) orderRepository.findAllByOrder_code(code);
    }

    public List<OrderEntity> getOrderByUserId(String code, long UserId) {
        return (List<OrderEntity>) orderRepository.findAllByUserId(code, UserId);
    }


    public void save(OrderDto orderDto) throws Exception {
        OrderEntity orderEntity = new OrderEntity();
        BillEntity billEntity = new BillEntity();
        BeanUtils.copyProperties(orderDto, orderEntity);
        BeanUtils.copyProperties(orderDto, billEntity);

        if(orderDto.getDelivery_address().isEmpty() || orderDto.getName_consignee().isEmpty() || orderDto.getDelivery_phone().isEmpty()){
            throw new Exception();
        }

        try {
            double totalPrice = 0;
            System.out.println(orderDto.getColor());
            for (int c = 0; c < orderDto.getCart().size(); c++){
            for (int i = 0; i < orderDto.getProduct().size(); i++){
                for (int j = 0; j < orderDto.getColor().size(); j++) {
                    for (int k = 0; k < orderDto.getSize().size(); k++) {
                        for (int h = 0; h < orderDto.getItemProduct().size(); h++) {
                            for (int g = 0; g < orderDto.getTotalPrice().size(); g++) {
                                if (c==i && i == j && j == k && k == h && h == g) {
                                    System.out.println("ok: " + i);
                                    Long datetime = System.currentTimeMillis();
                                    Timestamp timestamp = new Timestamp(datetime);
                                    orderEntity.setCreated_at(timestamp);
                                    orderEntity.setUpdated_at(timestamp);
                                    orderEntity.setColor_product(orderDto.getColor().get(j));
                                    orderEntity.setSize_product(orderDto.getSize().get(k));
                                    orderEntity.setItem(Integer.parseInt(orderDto.getItemProduct().get(h)));
                                    orderEntity.setPrice(orderDto.getTotalPrice().get(g));
                                    orderEntity.setOrder_code(orderDto.getOrder_code());
                                    orderEntity.setDelivery_address(orderDto.getDelivery_address());
                                    orderEntity.setName_consignee(orderDto.getName_consignee());
                                    orderEntity.setDelivery_phone(orderDto.getDelivery_phone());
                                    orderEntity.setPayment(0);
                                    orderEntity.setState(1);
                                    long productIdLong = Long.parseLong(orderDto.getProduct().get(i));
                                    ProductEntity productEntity = productService.get(productIdLong);
                                    int item = Integer.parseInt(productEntity.getTotalProduct());
                                    if(item >= orderEntity.getItem()){
                                        int total = item - orderEntity.getItem();
                                        String totalStr = String.valueOf(total);
                                        productRepository.changeTotal(totalStr, productIdLong);
                                    }else {
                                        throw new Exception("Please remove an empty product from the cart!");
                                    }

                                    double price = Double.parseDouble(orderDto.getTotalPrice().get(g));
                                    totalPrice = totalPrice + price;

                                    long productId = Long.parseLong(orderDto.getProduct().get(i));
                                    System.out.println("ProductId: " + productId);
                                    orderEntity.setProduct(productRepository.findById(productId).orElse(null));
                                    orderEntity.setUser(userRepository.findById((long) orderDto.getUserId()).orElse(null));

                                    orderRepository.save(orderEntity);
                                    cartRepository.deleteById(Long.parseLong(orderDto.getCart().get(c)));
                                }
                            }
                        }
                    }
                }
                }
            }
            Long datetime = System.currentTimeMillis();
            Timestamp timestampBill = new Timestamp(datetime);
            billEntity.setCreated_at(timestampBill);
            billEntity.setUpdated_at(timestampBill);
            billEntity.setOrder_code(orderDto.getOrder_code());
            billEntity.setDelivery_address(orderDto.getDelivery_address());
            billEntity.setName_consignee(orderDto.getName_consignee());
            billEntity.setDelivery_phone(orderDto.getDelivery_phone());
            billEntity.setPayment(0);
            billEntity.setState(1);
            double newTotalPrice = (double) Math.round(totalPrice * 100)/100;
            billEntity.setPrice(String.valueOf(newTotalPrice));
            billEntity.setUser(userRepository.findById((long) orderDto.getUserId()).orElse(null));
            billRepository.save(billEntity);


            Timestamp timestamp = new Timestamp(orderEntity.getCreated_at().getTime()+(86400000*5));

            String outTime = new SimpleDateFormat("dd/MM/yyyy kk:mm:ss").format(timestamp);

            String create = new SimpleDateFormat("dd/MM/yyyy").format(orderEntity.getCreated_at());

            // Lấy email của tài khoản  đa đăng nhập
            String email = ((UserEntity) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal()).getEmail();

            EmailDetails emailDetails = new EmailDetails();
            emailDetails.setRecipient(email);
            emailDetails.setSubject("[CẢM ƠN]XÁC NHẬN ĐẶT HÀNG THÀNH CÔNG TRÊN EKKA SHOP");
            emailDetails.setMsgBody("<!DOCTYPE HTML\n" +
                    "  PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
                    "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\"\n" +
                    "  xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n" +
                    "\n" +
                    "<head>\n" +
                    "  <!--[if gte mso 9]>\n" +
                    "<xml>\n" +
                    "  <o:OfficeDocumentSettings>\n" +
                    "    <o:AllowPNG/>\n" +
                    "    <o:PixelsPerInch>96</o:PixelsPerInch>\n" +
                    "  </o:OfficeDocumentSettings>\n" +
                    "</xml>\n" +
                    "<![endif]-->\n" +
                    "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                    "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                    "  <meta name=\"x-apple-disable-message-reformatting\">\n" +
                    "  <!--[if !mso]><!-->\n" +
                    "  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                    "  <!--<![endif]-->\n" +
                    "  <title></title>\n" +
                    "\n" +
                    "  <style type=\"text/css\">\n" +
                    "    @media only screen and (min-width: 570px) {\n" +
                    "      .u-row {\n" +
                    "        width: 550px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col {\n" +
                    "        vertical-align: top;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-24p79 {\n" +
                    "        width: 136.345px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-25 {\n" +
                    "        width: 137.5px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-33p33 {\n" +
                    "        width: 183.315px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-41p88 {\n" +
                    "        width: 230.34px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-50 {\n" +
                    "        width: 275px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col-100 {\n" +
                    "        width: 550px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "    }\n" +
                    "\n" +
                    "    @media (max-width: 570px) {\n" +
                    "      .u-row-container {\n" +
                    "        max-width: 100% !important;\n" +
                    "        padding-left: 0px !important;\n" +
                    "        padding-right: 0px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row .u-col {\n" +
                    "        min-width: 320px !important;\n" +
                    "        max-width: 100% !important;\n" +
                    "        display: block !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-row {\n" +
                    "        width: calc(100% - 40px) !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-col {\n" +
                    "        width: 100% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      .u-col>div {\n" +
                    "        margin: 0 auto;\n" +
                    "      }\n" +
                    "    }\n" +
                    "\n" +
                    "    body {\n" +
                    "      margin: 0;\n" +
                    "      padding: 0;\n" +
                    "    }\n" +
                    "\n" +
                    "    table,\n" +
                    "    tr,\n" +
                    "    td {\n" +
                    "      vertical-align: top;\n" +
                    "      border-collapse: collapse;\n" +
                    "    }\n" +
                    "\n" +
                    "    p {\n" +
                    "      margin: 0;\n" +
                    "    }\n" +
                    "\n" +
                    "    .ie-container table,\n" +
                    "    .mso-container table {\n" +
                    "      table-layout: fixed;\n" +
                    "    }\n" +
                    "\n" +
                    "    * {\n" +
                    "      line-height: inherit;\n" +
                    "    }\n" +
                    "\n" +
                    "    a[x-apple-data-detectors='true'] {\n" +
                    "      color: inherit !important;\n" +
                    "      text-decoration: none !important;\n" +
                    "    }\n" +
                    "\n" +
                    "    @media (max-width: 480px) {\n" +
                    "      .hide-mobile {\n" +
                    "        max-height: 0px;\n" +
                    "        overflow: hidden;\n" +
                    "        display: none !important;\n" +
                    "      }\n" +
                    "    }\n" +
                    "\n" +
                    "    table,\n" +
                    "    td {\n" +
                    "      color: #000000;\n" +
                    "    }\n" +
                    "\n" +
                    "    #u_body a {\n" +
                    "      color: #0000ee;\n" +
                    "      text-decoration: underline;\n" +
                    "    }\n" +
                    "\n" +
                    "    @media (max-width: 480px) {\n" +
                    "      #u_content_text_4 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 10px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_2 .v-container-padding-padding {\n" +
                    "        padding: 10px 10px 15px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_5 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_5 .v-src-width {\n" +
                    "        width: auto !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_5 .v-src-max-width {\n" +
                    "        max-width: 52% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_4 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_4 .v-src-width {\n" +
                    "        width: auto !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_4 .v-src-max-width {\n" +
                    "        max-width: 52% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_3 .v-container-padding-padding {\n" +
                    "        padding: 15px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_3 .v-src-width {\n" +
                    "        width: auto !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_image_3 .v-src-max-width {\n" +
                    "        max-width: 52% !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_17 .v-container-padding-padding {\n" +
                    "        padding: 10px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_17 .v-text-align {\n" +
                    "        text-align: center !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_text_5 .v-container-padding-padding {\n" +
                    "        padding: 10px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_2 .v-container-padding-padding {\n" +
                    "        padding: 10px 10px 20px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_2 .v-text-align {\n" +
                    "        text-align: center !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_2 .v-padding {\n" +
                    "        padding: 12px 55px !important;\n" +
                    "      }\n" +
                    "\n" +
                    "      #u_content_button_1 .v-text-align {\n" +
                    "        text-align: center !important;\n" +
                    "      }\n" +
                    "    }\n" +
                    "  </style>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "  <!--[if !mso]><!-->\n" +
                    "  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\">\n" +
                    "  <link href=\"https://fonts.googleapis.com/css?family=Raleway:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\">\n" +
                    "  <!--<![endif]-->\n" +
                    "\n" +
                    "</head>\n" +
                    "\n" +
                    "<body class=\"clean-body u_body\"\n" +
                    "  style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #ffffff;color: #000000\">\n" +
                    "  <!--[if IE]><div class=\"ie-container\"><![endif]-->\n" +
                    "  <!--[if mso]><div class=\"mso-container\"><![endif]-->\n" +
                    "  <table id=\"u_body\"\n" +
                    "    style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #ffffff;width:100%\"\n" +
                    "    cellpadding=\"0\" cellspacing=\"0\">\n" +
                    "    <tbody>\n" +
                    "      <tr style=\"vertical-align: top\">\n" +
                    "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "          <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #ffffff;\"><![endif]-->\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:20px 10px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                    "                                <tr>\n" +
                    "                                  <td class=\"v-text-align\" style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
                    "\n" +
                    "                                    <img align=\"center\" border=\"0\" src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-4.png?alt=media&token=dd3feaff-d148-4546-b9d6-f9b6dc894668\" alt=\"Logo\" title=\"Logo\"\n" +
                    "                                      style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 33%;max-width: 174.9px;\"\n" +
                    "                                      width=\"174.9\" class=\"v-src-width v-src-max-width\" />\n" +
                    "\n" +
                    "                                  </td>\n" +
                    "                                </tr>\n" +
                    "                              </table>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #eccafa;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #eccafa;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                    "                                <tr>\n" +
                    "                                  <td class=\"v-text-align\" style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
                    "\n" +
                    "                                    <img align=\"center\" border=\"0\" src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-5.jpeg?alt=media&token=77a345e8-0398-42c9-9753-316e4e30915a\" alt=\"Invoice Banner\"\n" +
                    "                                      title=\"Invoice Banner\"\n" +
                    "                                      style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\"\n" +
                    "                                      width=\"550\" class=\"v-src-width v-src-max-width\" />\n" +
                    "\n" +
                    "                                  </td>\n" +
                    "                                </tr>\n" +
                    "                              </table>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #f5dcfc;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #f5dcfc;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:20px 10px 0px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <h1 class=\"v-text-align\"\n" +
                    "                                style=\"margin: 0px; color: #272e79; line-height: 140%; text-align: left; word-wrap: break-word; font-weight: normal; font-family: 'Raleway',sans-serif; font-size: 22px;\">\n" +
                    "                                Dear ["+orderDto.getName_consignee()+"],\n" +
                    "                              </h1>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 10px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #333333; line-height: 150%; text-align: left; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Shipping\n" +
                    "                                    Details:</strong><br /><strong>Order Number:</strong> "+orderDto.getOrder_code()+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><br /><strong>Delivered-to:</strong>\n" +
                    "                                  "+orderDto.getName_consignee()+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Email:</strong> "+email+"\n" +
                    "                                </p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Phone:</strong> "+orderDto.getDelivery_phone()+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Address:</strong> "+orderDto.getDelivery_address()+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><br /><strong>Date Dispatched:</strong>\n" +
                    "                                  "+create+"</p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong>Expected Delivery Date:</strong>\n" +
                    "                                  "+outTime+"</p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #f5dcfc;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #f5dcfc;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px 10px 10px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #333333; line-height: 150%; text-align: left; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%; text-align: center;\"><span\n" +
                    "                                    style=\"font-size: 20px; line-height: 30px;\"><strong>Thank You for being with\n" +
                    "                                      Us!</strong></span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px 10px 30px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #333333; line-height: 150%; text-align: left; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><strong><span\n" +
                    "                                      style=\"font-size: 16px; line-height: 24px;\">Best Wishes,</span></strong></p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 150%;\"><span\n" +
                    "                                    style=\"font-size: 16px; line-height: 24px;\"><span\n" +
                    "                                      style=\"color: #3598db; font-size: 16px; line-height: 24px;\"><strong>EKKA\n" +
                    "                                        SHOP</strong></span> </span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"\n" +
                    "                                style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                    "                                <tbody>\n" +
                    "                                  <tr style=\"vertical-align: top\">\n" +
                    "                                    <td\n" +
                    "                                      style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                    "                                      <span>&#160;</span>\n" +
                    "                                    </td>\n" +
                    "                                  </tr>\n" +
                    "                                </tbody>\n" +
                    "                              </table>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-image: url('https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-8.png?alt=media&token=f10f46b6-dd11-4d33-8d8d-819856fb9b11');background-repeat: no-repeat;background-position: center top;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-image: url('https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-8.png?alt=media&token=f10f46b6-dd11-4d33-8d8d-819856fb9b11');background-repeat: no-repeat;background-position: center top;background-color: transparent;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"275\" style=\"width: 275px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-50\"\n" +
                    "                  style=\"max-width: 320px;min-width: 275px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table id=\"u_content_button_2\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\"\n" +
                    "                        cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 40px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->\n" +
                    "                              <div class=\"v-text-align\" align=\"right\">\n" +
                    "                                <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:40px; v-text-anchor:middle; width:157px;\" arcsize=\"32.5%\"  stroke=\"f\" fillcolor=\"#76388b\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:'Raleway',sans-serif;\"><![endif]-->\n" +
                    "                                <a href=\"http://localhost:8080/ekka/product\" target=\"_blank\" class=\"v-button\"\n" +
                    "                                  style=\"box-sizing: border-box;display: inline-block;font-family:'Raleway',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #76388b; border-radius: 13px;-webkit-border-radius: 13px; -moz-border-radius: 13px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">\n" +
                    "                                  <span class=\"v-padding\"\n" +
                    "                                    style=\"display:block;padding:12px 50px;line-height:120%;\"><span\n" +
                    "                                      style=\"font-size: 14px; line-height: 16.8px;\">SHOPPING NOW!</span></span>\n" +
                    "                                </a>\n" +
                    "                                <!--[if mso]></center></v:roundrect><![endif]-->\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"275\" style=\"width: 275px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-50\"\n" +
                    "                  style=\"max-width: 320px;min-width: 275px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table id=\"u_content_button_1\" style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\"\n" +
                    "                        cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 40px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->\n" +
                    "                              <div class=\"v-text-align\" align=\"left\">\n" +
                    "                                <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:40px; v-text-anchor:middle; width:166px;\" arcsize=\"32.5%\"  stroke=\"f\" fillcolor=\"#76388b\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:'Raleway',sans-serif;\"><![endif]-->\n" +
                    "                                <a href=\"http://localhost:8080/ekka/history/"+orderDto.getOrder_code()+"\" target=\"_blank\" class=\"v-button\"\n" +
                    "                                  style=\"box-sizing: border-box;display: inline-block;font-family:'Raleway',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #76388b; border-radius: 13px;-webkit-border-radius: 13px; -moz-border-radius: 13px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;\">\n" +
                    "                                  <span class=\"v-padding\"\n" +
                    "                                    style=\"display:block;padding:12px 25px;line-height:120%;\"><span\n" +
                    "                                      style=\"font-size: 14px; line-height: 16.8px;\">GO INVOICE NOW!</span></span>\n" +
                    "                                </a>\n" +
                    "                                <!--[if mso]></center></v:roundrect><![endif]-->\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "          <div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                    "            <div class=\"u-row\"\n" +
                    "              style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #1f2060;\">\n" +
                    "              <div\n" +
                    "                style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                    "                <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #1f2060;\"><![endif]-->\n" +
                    "\n" +
                    "                <!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                    "                <div class=\"u-col u-col-100\"\n" +
                    "                  style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
                    "                  <div style=\"height: 100%;width: 100% !important;\">\n" +
                    "                    <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    <div\n" +
                    "                      style=\"height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\">\n" +
                    "                      <!--<![endif]-->\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:35px 10px 10px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div align=\"center\">\n" +
                    "                                <div style=\"display: table; max-width:171px;\">\n" +
                    "                                  <!--[if (mso)|(IE)]><table width=\"171\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"border-collapse:collapse;\" align=\"center\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:171px;\"><tr><![endif]-->\n" +
                    "\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 11px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 11px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://facebook.com/\" title=\"Facebook\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-3.png?alt=media&token=2d3b9a22-c044-40f3-8226-13551f159047\" alt=\"Facebook\" title=\"Facebook\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 11px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 11px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://twitter.com/\" title=\"Twitter\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-2.png?alt=media&token=d1f8cff6-5d44-4f44-9961-8d7cae58c642\" alt=\"Twitter\" title=\"Twitter\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 11px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 11px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://linkedin.com/\" title=\"LinkedIn\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-6.png?alt=media&token=33212ffd-2153-4f8e-be09-0c71acf26513\" alt=\"LinkedIn\" title=\"LinkedIn\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 0px;\" valign=\"top\"><![endif]-->\n" +
                    "                                  <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\"\n" +
                    "                                    style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 0px\">\n" +
                    "                                    <tbody>\n" +
                    "                                      <tr style=\"vertical-align: top\">\n" +
                    "                                        <td align=\"left\" valign=\"middle\"\n" +
                    "                                          style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                    "                                          <a href=\"https://instagram.com/\" title=\"Instagram\" target=\"_blank\">\n" +
                    "                                            <img src=\"https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/image-1.png?alt=media&token=290a27e3-f7ef-41ba-b187-2e675e2bb683\" alt=\"Instagram\" title=\"Instagram\" width=\"32\"\n" +
                    "                                              style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                    "                                          </a>\n" +
                    "                                        </td>\n" +
                    "                                      </tr>\n" +
                    "                                    </tbody>\n" +
                    "                                  </table>\n" +
                    "                                  <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "\n" +
                    "\n" +
                    "                                  <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "                                </div>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 30px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                    "                                    style=\"font-size: 12px; line-height: 16.8px;\">Lorem ipsum is a placeholder text\n" +
                    "                                    commonly used to demonstrate the visual form of a document or a typeface without\n" +
                    "                                  </span><span style=\"font-size: 12px; line-height: 16.8px;\">relying on meaningful\n" +
                    "                                    content. </span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <table style=\"font-family:'Raleway',sans-serif;\" role=\"presentation\" cellpadding=\"0\"\n" +
                    "                        cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                    "                        <tbody>\n" +
                    "                          <tr>\n" +
                    "                            <td class=\"v-container-padding-padding\"\n" +
                    "                              style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 30px 15px;font-family:'Raleway',sans-serif;\"\n" +
                    "                              align=\"left\">\n" +
                    "\n" +
                    "                              <div class=\"v-text-align\"\n" +
                    "                                style=\"color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word;\">\n" +
                    "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                    "                                    style=\"font-size: 12px; line-height: 16.8px;\">&copy; Copyright 20XX. Your Brand All\n" +
                    "                                    Rights Reserved.</span></p>\n" +
                    "                                <p style=\"font-size: 14px; line-height: 140%;\"><span\n" +
                    "                                    style=\"text-decoration: underline; font-size: 14px; line-height: 19.6px;\"><span\n" +
                    "                                      style=\"font-size: 12px; line-height: 16.8px;\">Unsubscribe </span></span></p>\n" +
                    "                              </div>\n" +
                    "\n" +
                    "                            </td>\n" +
                    "                          </tr>\n" +
                    "                        </tbody>\n" +
                    "                      </table>\n" +
                    "\n" +
                    "                      <!--[if (!mso)&(!IE)]><!-->\n" +
                    "                    </div>\n" +
                    "                    <!--<![endif]-->\n" +
                    "                  </div>\n" +
                    "                </div>\n" +
                    "                <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                    "                <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                    "              </div>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "\n" +
                    "\n" +
                    "          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n" +
                    "        </td>\n" +
                    "      </tr>\n" +
                    "    </tbody>\n" +
                    "  </table>\n" +
                    "  <!--[if mso]></div><![endif]-->\n" +
                    "  <!--[if IE]></div><![endif]-->\n" +
                    "</body>\n" +
                    "\n" +
                    "</html>");
            emailService.sendMailWithAttachment(emailDetails);

        }catch (Exception ex){
            throw ex;
        }


    }
}
