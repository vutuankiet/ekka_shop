package com.example.ekka.controller.home;

import com.example.ekka.dto.CartDto;
import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.UrlDto;
import com.example.ekka.entities.*;
import com.example.ekka.helper.GenKey;
import com.example.ekka.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/ekka")
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    ProductService productService;

    @Autowired
    WishListService wishListService;

    @Autowired
    CartService cartService;

    @Autowired
    BillService billService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "order/save")
    public String createOrder(OrderDto orderDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m, HttpServletRequest request) {

        try {
//             Lấy ID của tài khoản  đa đăng nhập
            long UserId = ((UserEntity) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal()).getId();
            orderDto.setUserId((int) UserId);

            GenKey gen = new GenKey(10);
            orderDto.setOrder_code(gen.gen());

            orderDto.setPayment(0);
            orderDto.setState(1);

            System.out.println("OrderDto: "+orderDto);

            orderService.save(orderDto);
            model.addFlashAttribute("message_success", "Create new order successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "New order creation failed");
            System.out.println("New order creation failed");
            return "redirect:/ekka/cart";
        }

        return "redirect:/ekka/thank/" + orderDto.getOrder_code();
    }

    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = {"history"})
    public String list(Model model) {
//         Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        try {


            List<BillEntity> listBill = billService.findByUserId(UserId);
            List<OrderEntity> listOrder = orderService.findByUserId(UserId);
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            model.addAttribute("listBill",listBill);
            model.addAttribute("listOrder",listOrder);
            model.addAttribute("listProduct",listProduct);

            int countWishList = wishListService.countWishListUser(UserId);
            int countCart = cartService.countCartUser(UserId);
            List<ProductEntity> listProductByState = productService.listAllProductByState();

            model.addAttribute("listProductByState", listProductByState);
            model.addAttribute("countWishList", countWishList);
            model.addAttribute("countCart", countCart);

            model.addAttribute("orderDto", new OrderDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user_view/history";
    }

    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping("history/{code}")
    public String details(@PathVariable(name = "code") String code, Model model) {
//         Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        try {
            List<OrderEntity> listOrder = orderService.getOrderByUserId(code, UserId);
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

            int countWishList = wishListService.countWishListUser(UserId);
            int countCart = cartService.countCartUser(UserId);
            List<ProductEntity> listProductByState = productService.listAllProductByState();

            model.addAttribute("listProductByState", listProductByState);
            model.addAttribute("countWishList", countWishList);
            model.addAttribute("countCart", countCart);

            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime+(86400000*5));

            model.addAttribute("shippingEstimated", timestamp);

            double total = 0;
            for (OrderEntity order : listOrder) {
                double priceDiscount = Double.parseDouble(order.getProduct().getDiscount());
                double price = order.getProduct().getPriceProduct();
                total = total + (price * ((100 - priceDiscount)/100)) * order.getItem();
            }
            System.out.println("Total_price: "+ total);
            OrderDto orderDto = new OrderDto();
            orderDto.setTotal_price((double) Math.round(total*100)/100);
            model.addAttribute("orderDto", orderDto);

        }catch (Exception ex){
            throw ex;
        }

        return "user_view/history-details";
    }
}
