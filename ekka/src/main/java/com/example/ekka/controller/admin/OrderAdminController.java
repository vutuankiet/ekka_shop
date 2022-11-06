package com.example.ekka.controller.admin;

import com.example.ekka.dto.*;
import com.example.ekka.entities.*;
import com.example.ekka.service.BillService;
import com.example.ekka.service.OrderService;
import com.example.ekka.service.ProductService;
import com.example.ekka.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("ekka/admin/order")
public class OrderAdminController {
    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @Autowired
    BillService billService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list", "", "/"})
    public String list(Model model, HttpServletRequest request) {
        try {
            List<OrderEntity> listOrder = orderService.findAllByUpdateDesc();
            List<BillEntity> listBill = billService.findAllByUpdateDesc();
            List<UserEntity> listUser = userService.listAll();
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            model.addAttribute("listOrder",listOrder);
            model.addAttribute("listBill",listBill);
            model.addAttribute("listUser",listUser);
            model.addAttribute("listProduct",listProduct);

            model.addAttribute("orderDto", new OrderDto());

            UrlDto urlDto = new UrlDto();
            urlDto.setUrl(request.getRequestURL().toString());
            model.addAttribute("urlDto", urlDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/order/list";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"delivered"})
    public String listDelivered(Model model) {
        try {
            List<OrderEntity> listOrder = orderService.listAllDelivered();
            List<BillEntity> listBill = billService.listAllDelivered();
            List<UserEntity> listUser = userService.listAll();
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            model.addAttribute("listOrder",listOrder);
            model.addAttribute("listBill",listBill);
            model.addAttribute("listUser",listUser);
            model.addAttribute("listProduct",listProduct);

            model.addAttribute("orderDto", new OrderDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/order/delivered";
    }

    @PostMapping(value = "changeState0/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState0(@PathVariable(name = "code") String code, @ModelAttribute("urlDto") UrlDto urlDto, OrderDto orderDto, RedirectAttributes model, Model m) {
        List<OrderEntity> listOrder = orderService.findByUser(code);
        System.out.println("listOrder: "+listOrder);

        try {
            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (OrderEntity order : listOrder) {
                    System.out.println("order: " + order.getUser().getEmail());
                    testList.add(order.getUser().getEmail());

            }
            System.out.println("email: " + testList.get(0));
            orderDto.setEmail((String) testList.get(0));
        } catch (Exception ex) {
            throw ex;
        }

        try {
            orderDto.setOrder_code(code);
            orderService.changeState0(orderDto);
            model.addFlashAttribute("message_success", "Successful status change");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Status change failed");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState1/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState1(@PathVariable(name = "code") String code, OrderDto orderDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        List<OrderEntity> listOrder = orderService.findByUser(code);
        System.out.println("listOrder: "+listOrder);

        try {
            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (OrderEntity order : listOrder) {
                System.out.println("order: " + order.getUser().getEmail());
                testList.add(order.getUser().getEmail());

            }
            System.out.println("email: " + testList.get(0));
            orderDto.setEmail((String) testList.get(0));
        } catch (Exception ex) {
            throw ex;
        }

        try {
            orderDto.setOrder_code(code);
            orderService.changeState1(orderDto);
            model.addFlashAttribute("message_success", "Successful status change");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Status change failed");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState2/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState2(@PathVariable(name = "code") String code, OrderDto orderDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        List<OrderEntity> listOrder = orderService.findByUser(code);
        System.out.println("listOrder: "+listOrder);

        try {
            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (OrderEntity order : listOrder) {
                System.out.println("order: " + order.getUser().getEmail());
                testList.add(order.getUser().getEmail());

            }
            System.out.println("email: " + testList.get(0));
            orderDto.setEmail((String) testList.get(0));
        } catch (Exception ex) {
            throw ex;
        }

        try {
            orderDto.setOrder_code(code);
            orderService.changeState2(orderDto);
            model.addFlashAttribute("message_success", "Successful status change");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Status change failed");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState3/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState3(@PathVariable(name = "code") String code, OrderDto orderDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        List<OrderEntity> listOrder = orderService.findByUser(code);
        System.out.println("listOrder: "+listOrder);

        try {
            String[] arr = {};
            String[] userId = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            List listUser = new ArrayList<>(Arrays.asList(userId));
            for (OrderEntity order : listOrder) {
                System.out.println("UserId: " + order.getUser().getId());
                testList.add(order.getUser().getEmail());
                listUser.add(order.getUser().getId());

            }
            System.out.println("email: " + testList.get(0));
            orderDto.setEmail((String) testList.get(0));
            System.out.println("ID: "+listUser.get(0));
            long id = (long) listUser.get(0);
            orderDto.setIdUser(id);
        } catch (Exception ex) {
            throw ex;
        }

        try {
            orderDto.setOrder_code(code);
            orderService.changeState3(orderDto);
            model.addFlashAttribute("message_success", "Successful status change");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Status change failed");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState4/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState4(@PathVariable(name = "code") String code, OrderDto orderDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        List<OrderEntity> listOrder = orderService.findByUser(code);
        System.out.println("listOrder: "+listOrder);

        try {
            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (OrderEntity order : listOrder) {
                System.out.println("order: " + order.getUser().getEmail());
                testList.add(order.getUser().getEmail());

            }
            System.out.println("email: " + testList.get(0));
            orderDto.setEmail((String) testList.get(0));
        } catch (Exception ex) {
            throw ex;
        }

        try {
            orderDto.setOrder_code(code);
            orderService.changeState4(orderDto);
            model.addFlashAttribute("message_success", "Successful status change");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Status change failed");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("details/{code}")
    public String details(@PathVariable(name = "code") String code, Model model) {
        try {
            List<OrderEntity> listOrder = orderService.get(code);
            System.out.println("order: " + listOrder);
            model.addAttribute("listOrder",listOrder);

            try {
                String[] arr = {};
                String[] address = {};
                String[] name = {};
                String[] phone = {};
                String[] payment = {};
                String[] create = {};
                String[] update = {};
                String[] state = {};
                List testList = new ArrayList<>(Arrays.asList(arr));
                List listDeliveryAddress = new ArrayList<>(Arrays.asList(address));
                List listNameConsignee = new ArrayList<>(Arrays.asList(name));
                List listDeliveryPhone = new ArrayList<>(Arrays.asList(phone));
                List listPayment = new ArrayList<>(Arrays.asList(payment));
                List listCreate = new ArrayList<>(Arrays.asList(create));
                List listUpdate = new ArrayList<>(Arrays.asList(update));
                List listState = new ArrayList<>(Arrays.asList(state));
                for (OrderEntity order : listOrder) {
                    System.out.println("order: " + order.getOrder_code());
                    testList.add(order.getOrder_code());
                    listDeliveryAddress.add(order.getDelivery_address());
                    listNameConsignee.add(order.getName_consignee());
                    listDeliveryPhone.add(order.getDelivery_phone());
                    listPayment.add(order.getPayment());
                    listCreate.add(order.getCreated_at());
                    listUpdate.add(order.getUpdated_at());
                    listState.add(order.getState());

                }
                System.out.println("order: " + testList.get(0));
                model.addAttribute("order_code", testList.get(0));
                model.addAttribute("delivery_address", listDeliveryAddress.get(0));
                model.addAttribute("name_consignee", listNameConsignee.get(0));
                model.addAttribute("delivery_phone", listDeliveryPhone.get(0));
                model.addAttribute("payment", listPayment.get(0));
                model.addAttribute("created_at", listCreate.get(0));
                model.addAttribute("updated_at", listUpdate.get(0));
                model.addAttribute("state", listState.get(0));
            } catch (Exception ex) {
                throw ex;
            }

            double total = 0;
            for (OrderEntity order : listOrder) {
                double priceDiscount = Double.parseDouble(order.getProduct().getDiscount());
                double price = order.getProduct().getPriceProduct();
                total = total + (price * ((100 - priceDiscount)/100)) * order.getItem();
            }
            System.out.println("Total_price: "+ total);
            OrderDto orderDto = new OrderDto();
            orderDto.setTotal_price(total);
            model.addAttribute("orderDto", orderDto);

        }catch (Exception ex){
            throw ex;
        }

        return "admin_view/order/details";
    }
}
