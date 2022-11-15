package com.example.ekka.controller.home;

import com.example.ekka.config.language.MessageConfig;
import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.ResponseDataTableDto;
import com.example.ekka.dto.UrlDto;
import com.example.ekka.dto.WishListDto;
import com.example.ekka.entities.*;
import com.example.ekka.paging.PagingParam;
import com.example.ekka.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/ekka")
public class WishListController {
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
    BrandService brandService;

    @Autowired
    WishListService wishListService;

    @Autowired
    ProductImageService productImageService;

    @Autowired
    CartService cartService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = {"wish-list"})
    public String wishList(Model model, HttpServletRequest request) {
        try {
            // Lấy ID của tài khoản  đa đăng nhập
            long id = ((UserEntity) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal()).getId();
            List<WishListEntity> listWishListUserId = wishListService.listAllUserId(id);
            List<CartEntity> listCartUserId = cartService.listAllUserId(id);


            List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
            List<ProductColorEntity> listProductColor = productColorService.listAll();
            List<ProductSizeEntity> listProductSize = productSizeService.listAll();
            List<CategoryEntity> listCategory = categoryService.listAll();
            int countWishList = wishListService.countWishListUser(id);
            int countCart = cartService.countCartUser(id);
            List<ProductEntity> listProductByState = productService.listAllProductByState();

            model.addAttribute("listProductByState", listProductByState);
            model.addAttribute("countWishList", countWishList);
            model.addAttribute("countCart", countCart);
            
            model.addAttribute("listWishListUserId", listWishListUserId);
            model.addAttribute("listCartUserId", listCartUserId);
            model.addAttribute("listGenderCategory", listGenderCategory);
            model.addAttribute("listProductColor", listProductColor);
            model.addAttribute("listProductSize", listProductSize);
            model.addAttribute("listCategory", listCategory);

            System.out.println("listWishListUserId: "+listWishListUserId);
            UrlDto urlDto = new UrlDto();
            urlDto.setUrl(request.getRequestURL().toString());
            model.addAttribute("urlDto", urlDto);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user_view/wish-list";
    }

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "wish-list/create/{id}")
    public String createWishList(@PathVariable(name = "id") int id,@RequestParam String url, WishListDto wishListDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m, HttpServletRequest request) {
        // Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        try {
            wishListDto.setUserId((int) UserId);
            wishListDto.setProductId(id);
            wishListDto.setState(1);
            wishListService.createWishList(wishListDto);
            model.addFlashAttribute("message_success", "Create a new wish list successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "New wish list creation failed");
        }
        System.out.println("id:"+id);

        System.out.println("Url:" + url);

        return "redirect:"+url;
    }

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @PostMapping(value = "wish-list/delete/{id}")
    public String deleteWishList(@PathVariable(name = "id") int id,@RequestParam String url, WishListDto wishListDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        try {
            wishListDto.setId(id);
            wishListService.deleteWishList(wishListDto);
            model.addFlashAttribute("message_success", "Delete wish list successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Deleting wish list failed");
        }
        System.out.println("id:"+id);


        return "redirect:"+url;
    }
}
