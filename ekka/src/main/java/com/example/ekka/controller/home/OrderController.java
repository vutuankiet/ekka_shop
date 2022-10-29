package com.example.ekka.controller.home;

import com.example.ekka.dto.CartDto;
import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.UrlDto;
import com.example.ekka.entities.ProductColorEntity;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.helper.GenKey;
import com.example.ekka.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/ekka")
public class OrderController {
    @Autowired
    OrderService orderService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "order/save")
    public String createOrder(OrderDto orderDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m, HttpServletRequest request) {

        try {
            // Lấy ID của tài khoản  đa đăng nhập
            long UserId = ((UserEntity) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal()).getId();
            orderDto.setUserId((int) UserId);

            GenKey gen = new GenKey(10);
            orderDto.setOrder_code(gen.gen());

            orderDto.setPayment(0);
            orderDto.setState(1);

            System.out.println("OrderDto: "+orderDto);

            orderService.save(orderDto);
            model.addFlashAttribute("message", "Tạo mới product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Tạo mới product không thành công");
            return "redirect:/ekka/cart";
        }

        return "redirect:/ekka/thank";
    }
}
