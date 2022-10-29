package com.example.ekka.controller.home;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ekka")
public class ThankController {
    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = "thank")
    public String thankYou(Model model){
        return "user_view/thank";
    }
}
