package com.example.ekka.controller.home;

import com.example.ekka.dto.ContactDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.service.CartService;
import com.example.ekka.service.ContactService;
import com.example.ekka.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/ekka")
public class ContactUsController {
    @Autowired
    WishListService wishListService;

    @Autowired
    CartService cartService;

    @Autowired
    ContactService contactService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = "contact-us")
    public String contactUs(Model model){
        // Lấy ID của tài khoản  đa đăng nhập
        long id = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();

        int countWishList = wishListService.countWishListUser(id);
        int countCart = cartService.countCartUser(id);

        model.addAttribute("countWishList", countWishList);
        model.addAttribute("countCart", countCart);

        model.addAttribute("contactDto", new ContactDto());

        return "user_view/contact-us";
    }

    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "contact-us/save")
    public String saveContact(ContactDto contactDto, RedirectAttributes model, Model m, HttpServletRequest request) {
        // Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        try {
            contactDto.setUserId(UserId);
            contactService.save(contactDto);
            model.addFlashAttribute("message_success", "Tao contact thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Tao contact không thành công");
        }


        return "redirect:/ekka/contact-us";
    }
}
