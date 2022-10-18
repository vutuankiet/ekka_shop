package com.example.ekka.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.ekka.dto.UserDto;

@Controller
@RequestMapping("/backend/brand")
public class BrandController1 {
    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "brand/create";
    }
}
