package com.example.ekka.controller.home;

import com.example.ekka.dto.*;
import com.example.ekka.entities.*;
import com.example.ekka.paging.PagingParam;
import com.example.ekka.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.ekka.config.language.MessageConfig;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/ekka")
public class HomeController {
    @Autowired
    MessageConfig messageConfig;

    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    @Autowired
    GenderCategoryService genderCategoryService;

    @Autowired
    ProductColorService productColorService;

    @Autowired
    ProductSizeService productSizeService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    WishListService wishListService;

    @Autowired
    CartService cartService;

    @Autowired
    ReviewService reviewService;

    @Autowired
    BrandService brandService;

    //quyền USER va an danh được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ANONYMOUS')")
    @GetMapping(value = {"home", "", "/"})
    public String homeUser(@PagingParam(path = "home") ResponseDataTableDto responseDataTableDto, Model model, HttpServletRequest request) {
        try {
            System.out.println(SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString());
            if(Objects.equals(SecurityContextHolder.getContext()
                    .getAuthentication().getAuthorities().toString(), "[ROLE_ANONYMOUS]")){
                List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
                List<ProductColorEntity> listProductColor = productColorService.listAll();
                List<ProductSizeEntity> listProductSize = productSizeService.listAll();
                List<CategoryEntity> listCategory = categoryService.listAll();
                List<BrandEntity> listBrand = brandService.listAll();
                List<ProductEntity> listProductByState = productService.listAllProductByState();

                model.addAttribute("listGenderCategory", listGenderCategory);
                model.addAttribute("listProductColor", listProductColor);
                model.addAttribute("listProductSize", listProductSize);
                model.addAttribute("listCategory", listCategory);
                model.addAttribute("listBrand", listBrand);
                model.addAttribute("listProductByState", listProductByState);

                UrlDto urlDto = new UrlDto();
                urlDto.setUrl(request.getRequestURL().toString());
                model.addAttribute("urlDto", urlDto);


                productService.list(responseDataTableDto);
            }else if(Objects.equals(SecurityContextHolder.getContext()
                    .getAuthentication().getAuthorities().toString(), "[ROLE_USER]")){
                // Lấy ID của tài khoản  đa đăng nhập
                long id = ((UserEntity) SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal()).getId();
                List<WishListEntity> listWishListUserId = wishListService.listAllUserId(id);
                List<CartEntity> listCartUserId = cartService.listAllUserId(id);

                List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
                List<ProductColorEntity> listProductColor = productColorService.listAll();
                List<ProductSizeEntity> listProductSize = productSizeService.listAll();
                List<CategoryEntity> listCategory = categoryService.listAll();
                List<BrandEntity> listBrand = brandService.listAll();
                List<ProductEntity> listProductByState = productService.listAllProductByState();
                int countWishList = wishListService.countWishListUser(id);
                int countCart = cartService.countCartUser(id);

                model.addAttribute("countWishList", countWishList);
                model.addAttribute("countCart", countCart);

                model.addAttribute("listWishListUserId", listWishListUserId);
                model.addAttribute("listCartUserId", listCartUserId);
                model.addAttribute("listGenderCategory", listGenderCategory);
                model.addAttribute("listProductColor", listProductColor);
                model.addAttribute("listProductSize", listProductSize);
                model.addAttribute("listCategory", listCategory);
                model.addAttribute("listBrand", listBrand);
                model.addAttribute("listProductByState", listProductByState);

                System.out.println("listWishListUserId: " + listWishListUserId);
                UrlDto urlDto = new UrlDto();
                urlDto.setUrl(request.getRequestURL().toString());
                model.addAttribute("urlDto", urlDto);


                productService.list(responseDataTableDto);
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user_view/home";
    }


}
