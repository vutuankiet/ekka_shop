package com.example.ekka.controller.admin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("ekka/admin")
public class AdminController {

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"dashboard", "", "/"})
    public String dashboard(Model model){
        return "admin_view/dashboard";
    }
}
