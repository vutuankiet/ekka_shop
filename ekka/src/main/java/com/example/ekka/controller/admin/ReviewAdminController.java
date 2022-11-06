package com.example.ekka.controller.admin;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.dto.UrlDto;
import com.example.ekka.entities.*;
import com.example.ekka.service.ProductService;
import com.example.ekka.service.ReviewService;
import com.example.ekka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Arrays;
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

    @PostMapping(value = "delete/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String deleteReview(@PathVariable(name = "id") long id, ReviewDto reviewDto, RedirectAttributes model, Model m) {
        try {
            reviewDto.setId(id);
            reviewService.deleteReview(reviewDto);
            model.addFlashAttribute("message_success", "Delete review successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Delete review failed");
        }

        return "redirect:/ekka/admin/review/list/";
    }

    @PostMapping(value = "restore/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String restoreReview(@PathVariable(name = "id") long id, ReviewDto reviewDto, RedirectAttributes model, Model m) {
        try {
            reviewDto.setId(id);
            reviewService.restoreReview(reviewDto);
            model.addFlashAttribute("message_success", "Successful review recovery");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Review recovery failed");
        }

        return "redirect:/ekka/admin/review/list/";
    }
}
