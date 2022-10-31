package com.example.ekka.controller.home;

import com.example.ekka.entities.UserEntity;
import com.example.ekka.service.CartService;
import com.example.ekka.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ekka")
public class AboutUsController {
    @Autowired
    WishListService wishListService;

    @Autowired
    CartService cartService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = "about-us")
    public String aboutUs(Model model){
        // Lấy ID của tài khoản  đa đăng nhập
        long id = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();

        int countWishList = wishListService.countWishListUser(id);
        int countCart = cartService.countCartUser(id);

        model.addAttribute("countWishList", countWishList);
        model.addAttribute("countCart", countCart);
        return "user_view/about-us";
    }
}
