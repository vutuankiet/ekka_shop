package com.example.ekka.controller.admin;

import com.example.ekka.dto.ProductDto;
import com.example.ekka.dto.UrlDto;
import com.example.ekka.entities.*;
import com.example.ekka.service.BillService;
import com.example.ekka.service.OrderService;
import com.example.ekka.service.ProductService;
import com.example.ekka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("ekka/admin")
public class AdminController {
    @Autowired
    ProductService productService;

    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    @Autowired
    BillService billService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"dashboard", "", "/"})
    public String dashboard(Model model, HttpServletRequest request){
        try {
            List<OrderEntity> listDelivered = orderService.listAllDelivered();

            try {
                String[] arr = {};
                double total = 0;
                List testList = new ArrayList<>(Arrays.asList(arr));
                for (OrderEntity order : listDelivered) {
                    double price = Double.parseDouble(order.getPrice());
                    total = total + price;
                }
                model.addAttribute("countRevenue", (double) Math.round(total*100)/100);
            } catch (Exception ex) {
                throw ex;
            }

            int countProduct = productService.countProduct();
            int countOrder = orderService.countAll();
            int countOrderDelivered = orderService.countAllDelivered();
            int countUser = userService.countAll();
            System.out.println("count product: " + countProduct);


            model.addAttribute("countProduct", countProduct);
            model.addAttribute("countOrder", countOrder);
            model.addAttribute("countOrderDelivered", countOrderDelivered);
            model.addAttribute("countUser", countUser);

            List<OrderEntity> listOrder = orderService.findAllByUpdateDesc();
            List<BillEntity> listBill = billService.findAllByUpdateDesc();
            List<UserEntity> listUser = userService.listAllUpdatedUser();
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            model.addAttribute("listOrder",listOrder);
            model.addAttribute("listBill",listBill);
            model.addAttribute("listUser",listUser);
            model.addAttribute("listProduct",listProduct);
            model.addAttribute("productDto", new ProductDto());

            UrlDto urlDto = new UrlDto();
            urlDto.setUrl(request.getRequestURL().toString());
            model.addAttribute("urlDto", urlDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/dashboard";
    }
}
