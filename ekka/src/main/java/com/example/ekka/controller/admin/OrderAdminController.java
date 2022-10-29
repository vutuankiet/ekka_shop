package com.example.ekka.controller.admin;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.ProductDto;
import com.example.ekka.dto.UserDto;
import com.example.ekka.entities.*;
import com.example.ekka.service.OrderService;
import com.example.ekka.service.ProductService;
import com.example.ekka.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("ekka/admin/order")
public class OrderAdminController {
    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list", "", "/"})
    public String list(Model model) {
        try {
            List<OrderEntity> listOrder = orderService.findAllByUpdateDesc();
            List<UserEntity> listUser = userService.listAll();
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            model.addAttribute("listOrder",listOrder);
            model.addAttribute("listUser",listUser);
            model.addAttribute("listProduct",listProduct);

            model.addAttribute("orderDto", new OrderDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/order/list";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"delivered"})
    public String listDelivered(Model model) {
        try {
            List<OrderEntity> listOrder = orderService.listAllDelivered();
            List<UserEntity> listUser = userService.listAll();
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            model.addAttribute("listOrder",listOrder);
            model.addAttribute("listUser",listUser);
            model.addAttribute("listProduct",listProduct);

            model.addAttribute("orderDto", new OrderDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/order/delivered";
    }

    @PostMapping(value = "changeState0/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState0(@PathVariable(name = "code") String code, OrderDto orderDto, RedirectAttributes model, Model m) {
        try {
            orderDto.setOrder_code(code);
            orderService.changeState0(orderDto);
            model.addFlashAttribute("message", "Xoa product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa product không thành công");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState1/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState1(@PathVariable(name = "code") String code, OrderDto orderDto, RedirectAttributes model, Model m) {
        try {
            orderDto.setOrder_code(code);
            orderService.changeState1(orderDto);
            model.addFlashAttribute("message", "Xoa product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa product không thành công");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState2/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState2(@PathVariable(name = "code") String code, OrderDto orderDto, RedirectAttributes model, Model m) {
        try {
            orderDto.setOrder_code(code);
            orderService.changeState2(orderDto);
            model.addFlashAttribute("message", "Xoa product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa product không thành công");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState3/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState3(@PathVariable(name = "code") String code, OrderDto orderDto, RedirectAttributes model, Model m) {
        try {
            orderDto.setOrder_code(code);
            orderService.changeState3(orderDto);
            model.addFlashAttribute("message", "Xoa product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa product không thành công");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    @PostMapping(value = "changeState4/{code}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changeState4(@PathVariable(name = "code") String code, OrderDto orderDto, RedirectAttributes model, Model m) {
        try {
            orderDto.setOrder_code(code);
            orderService.changeState4(orderDto);
            model.addFlashAttribute("message", "Xoa product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa product không thành công");
        }

        return "redirect:/ekka/admin/order/list/";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("details/{code}")
    public String details(@PathVariable(name = "code") String code, Model model) {
        try {
            List<OrderEntity> listOrder = orderService.get(code);
            System.out.println("order: " + listOrder);
            model.addAttribute("listOrder",listOrder);

            double total = 0;
            for (OrderEntity order : listOrder) {
                double priceDiscount = Double.parseDouble(order.getProduct().getDiscount());
                double price = Double.parseDouble(order.getProduct().getPriceProduct());
                total = total + (price * ((100 - priceDiscount)/100)) * order.getItem();
            }
            System.out.println("Total_price: "+ total);
            OrderDto orderDto = new OrderDto();
            orderDto.setTotal_price(total);
            model.addAttribute("orderDto", orderDto);

        }catch (Exception ex){
            throw ex;
        }

        return "admin_view/order/details";
    }
}
