package com.example.ekka.controller.home;

import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.service.CartService;
import com.example.ekka.service.ProductService;
import com.example.ekka.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/ekka")
public class FaqController {
    @Autowired
    WishListService wishListService;

    @Autowired
    ProductService productService;

    @Autowired
    CartService cartService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ANONYMOUS')")
    @GetMapping(value = "faq")
    public String faq(Model model){
        try {
            if(Objects.equals(SecurityContextHolder.getContext()
                    .getAuthentication().getAuthorities().toString(), "[ROLE_ANONYMOUS]")){
                List<ProductEntity> listProductByState = productService.listAllProductByState();

                model.addAttribute("listProductByState", listProductByState);
            } else if(Objects.equals(SecurityContextHolder.getContext()
                    .getAuthentication().getAuthorities().toString(), "[ROLE_USER]")){
                // Lấy ID của tài khoản  đa đăng nhập
                long id = ((UserEntity) SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal()).getId();

                int countWishList = wishListService.countWishListUser(id);
                int countCart = cartService.countCartUser(id);
                List<ProductEntity> listProductByState = productService.listAllProductByState();

                model.addAttribute("listProductByState", listProductByState);
                model.addAttribute("countWishList", countWishList);
                model.addAttribute("countCart", countCart);

            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "user_view/faq";
    }
}
