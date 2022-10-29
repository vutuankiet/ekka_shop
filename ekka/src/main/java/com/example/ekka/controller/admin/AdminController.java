package com.example.ekka.controller.admin;

import com.example.ekka.dto.ProductDto;
import com.example.ekka.entities.*;
import com.example.ekka.service.OrderService;
import com.example.ekka.service.ProductService;
import com.example.ekka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"dashboard", "", "/"})
    public String dashboard(Model model){
        try {
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
            List<UserEntity> listUser = userService.listAllUpdatedUser();
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            model.addAttribute("listOrder",listOrder);
            model.addAttribute("listUser",listUser);
            model.addAttribute("listProduct",listProduct);
            model.addAttribute("productDto", new ProductDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/dashboard";
    }
}
