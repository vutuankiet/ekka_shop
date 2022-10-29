package com.example.ekka.controller.home;

import com.example.ekka.dto.*;
import com.example.ekka.entities.*;
import com.example.ekka.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/ekka")
public class CartController {
    @Autowired
    CartService cartService;

    @Autowired
    ProductColorService productColorService;

    @Autowired
    ProductSizeService productSizeService;

    @Autowired
    ProductService productService;

    @Autowired
    WishListService wishListService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = {"cart"})
    public String cart(Model model, HttpServletRequest request) {
        try {
            // Lấy ID của tài khoản  đa đăng nhập
            long id = ((UserEntity) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal()).getId();
            List<CartEntity> listCartUserId = cartService.listAllUserId(id);


            List<ProductColorEntity> listProductColor = productColorService.listAll();
            List<ProductSizeEntity> listProductSize = productSizeService.listAll();
            int countWishList = wishListService.countWishList();
            int countCart = cartService.countCart();

            model.addAttribute("countWishList", countWishList);
            model.addAttribute("countCart", countCart);

            model.addAttribute("listCartUserId", listCartUserId);
            model.addAttribute("listProductColor", listProductColor);
            model.addAttribute("listProductSize", listProductSize);
            UrlDto urlDto = new UrlDto();
            urlDto.setUrl(request.getRequestURL().toString());
            model.addAttribute("urlDto", urlDto);
            model.addAttribute("orderDto", new OrderDto());

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "user_view/cart";
    }

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "cart/create/{id}")
    public String createWishList(@PathVariable(name = "id") int id, CartDto cartDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m, HttpServletRequest request) {
        List<ProductColorEntity> listProductColor = productColorService.listAll();
        List<ProductSizeEntity> listProductSize = productSizeService.listAll();
        List<ProductEntity> listProduct = productService.listAllProductId(id);

        // Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        try {
            cartDto.setUserId((int) UserId);
            cartDto.setProductId(id);
            cartDto.setState(1);
            cartDto.setItem(1);
            double total = 0;
            for (ProductEntity product : listProduct) {
                double priceDiscount = Double.parseDouble(product.getDiscount());
                double price = Double.parseDouble(product.getPriceProduct());
                total = total + (price * ((100 - priceDiscount)/100)) * cartDto.getItem();
            }
            System.out.println("Total_price: "+ total);
            cartDto.setPrice(String.valueOf(total));
            try {
                String[] arr = {};
                List testList = new ArrayList<>(Arrays.asList(arr));
                for (ProductColorEntity colors : listProductColor) {
                    if (colors.getProduct().getId() == cartDto.getProductId()) {
                        System.out.println("color: " + colors.getColorName());
                        testList.add(colors.getColorName());
                        System.out.println("color: " + testList);

                    }
                }
                System.out.println("color: " + testList.get(0));
                cartDto.setColor_product((String) testList.get(0));
            } catch (Exception ex) {
                throw ex;
            }

            try {
                String[] arr = {};
                List testList = new ArrayList<>(Arrays.asList(arr));
                for (ProductSizeEntity size : listProductSize) {
                    if (size.getProduct().getId() == cartDto.getProductId()) {
                        System.out.println("size: " + size.getSizeName());
                        testList.add(size.getSizeName());
                        System.out.println("size: " + testList);

                    }
                }
                System.out.println("size: " + testList.get(0));
                cartDto.setSize_product((String) testList.get(0));
            } catch (Exception ex) {
                throw ex;
            }
            cartService.createCart(cartDto);
            model.addFlashAttribute("message", "Them cart thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Them cart không thành công");
        }
        System.out.println("id:"+id);

        System.out.println("Url:" + urlDto.getUrl());

        return "redirect:"+urlDto.getUrl();
    }

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "cart/create-cart-detail/{id}")
    public String createWishList(@PathVariable(name = "id") int id, CartDto cartDto, @ModelAttribute("addCartDto") AddCartDto addCartDto, RedirectAttributes model, Model m, HttpServletRequest request) {
        List<ProductColorEntity> listProductColor = productColorService.listAll();
        List<ProductSizeEntity> listProductSize = productSizeService.listAll();
        List<ProductEntity> listProduct = productService.listAllProductId(id);


        // Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        try {
            cartDto.setUserId((int) UserId);
            cartDto.setProductId(id);
            cartDto.setState(1);
            cartDto.setItem(addCartDto.getItem());
            double total = 0;
            for (ProductEntity product : listProduct) {
                double priceDiscount = Double.parseDouble(product.getDiscount());
                double price = Double.parseDouble(product.getPriceProduct());
                total = total + (price * ((100 - priceDiscount)/100)) * addCartDto.getItem();
            }
            System.out.println("Total_price: "+ total);
            cartDto.setPrice(String.valueOf(total));
            try {
                String[] arr = {};
                List testList = new ArrayList<>(Arrays.asList(arr));
                for (ProductColorEntity colors : listProductColor) {
                    if (colors.getProduct().getId() == cartDto.getProductId()) {
                        System.out.println("color: " + colors.getColorName());
                        testList.add(colors.getColorName());
                        System.out.println("color: " + testList);

                    }
                }
                System.out.println("color: " + testList.get(0));
                if(addCartDto.getColor_product().isEmpty()){
                    cartDto.setColor_product((String) testList.get(0));
                }else {
                    cartDto.setColor_product(addCartDto.getColor_product());
                }
            } catch (Exception ex) {
                throw ex;
            }

            try {
                String[] arr = {};
                List testList = new ArrayList<>(Arrays.asList(arr));
                for (ProductSizeEntity size : listProductSize) {
                    if (size.getProduct().getId() == cartDto.getProductId()) {
                        System.out.println("size: " + size.getSizeName());
                        testList.add(size.getSizeName());
                        System.out.println("size: " + testList);

                    }
                }
                System.out.println("size: " + testList.get(0));
                if(addCartDto.getSize_product().isEmpty()){
                    cartDto.setSize_product((String) testList.get(0));
                }else {
                    cartDto.setSize_product(addCartDto.getSize_product());
                }
            } catch (Exception ex) {
                throw ex;
            }
            cartService.createCart(cartDto);
            model.addFlashAttribute("message", "Them cart thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Them cart không thành công");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/cart";
    }

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "cart/delete/{id}")
    public String deleteWishList(@PathVariable(name = "id") int id, CartDto cartDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        try {
            cartDto.setId(id);
            cartService.deleteCart(cartDto);
            model.addFlashAttribute("message", "Xoa cart thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa cart không thành công");
        }
        System.out.println("id:"+id);


        return "redirect:"+urlDto.getUrl();
    }
}
