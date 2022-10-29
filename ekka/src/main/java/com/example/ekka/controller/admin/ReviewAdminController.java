package com.example.ekka.controller.admin;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.entities.*;
import com.example.ekka.service.ProductService;
import com.example.ekka.service.ReviewService;
import com.example.ekka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("ekka/admin/review")
public class ReviewAdminController {
    @Autowired
    ReviewService reviewService;

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list","","/"})
    public String list(Model model) {
        try {
            List<ReviewEntity> listReview = reviewService.listAllCreateDesc();
            List<UserEntity> listUser = userService.listAll();
            List<ProductEntity> listProduct = productService.listAll();
            model.addAttribute("listReview",listReview);
            model.addAttribute("listUser",listUser);
            model.addAttribute("listProduct",listProduct);

            model.addAttribute("reviewDto", new ReviewDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/review/list";
    }
}
