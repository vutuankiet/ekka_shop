package com.example.ekka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.ekka.config.language.MessageConfig;
import com.example.ekka.dto.ChangePasswordDto;
import com.example.ekka.dto.ResponseDto;
import com.example.ekka.service.UserService;

@Controller
@RequestMapping("/ekka")
public class HomeController {
    @Autowired
    MessageConfig messageConfig;

    @Autowired
    UserService userService;

    @GetMapping(value = {"home", "", "/"})
    public String home(Model model) {
        return "user_view/home";
    }

}
