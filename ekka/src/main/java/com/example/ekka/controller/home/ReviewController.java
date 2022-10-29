package com.example.ekka.controller.home;

import com.example.ekka.dto.CartDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.dto.UrlDto;
import com.example.ekka.entities.ProductColorEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ProductSizeEntity;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/ekka")
public class ReviewController {
    @Autowired
    ReviewService reviewService;

    @Autowired
    CartService cartService;

    @Autowired
    ProductColorService productColorService;

    @Autowired
    ProductSizeService productSizeService;

    @Autowired
    ProductService productService;

    @Autowired
    WishListService wishListService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "review/create/{id}")
    public String createReview(@PathVariable(name = "id") int id, ReviewDto reviewDto, RedirectAttributes model, Model m, HttpServletRequest request) {
        // Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        try {
            reviewDto.setUserId((int) UserId);
            reviewDto.setProductId(id);
            reviewDto.setState(1);
            reviewService.save(reviewDto);
            model.addFlashAttribute("message", "Tao review thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Tao review không thành công");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/product-details/"+id;
    }
}
