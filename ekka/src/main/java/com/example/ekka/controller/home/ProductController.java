package com.example.ekka.controller.home;

import com.example.ekka.config.language.MessageConfig;
import com.example.ekka.dto.*;
import com.example.ekka.entities.*;
import com.example.ekka.paging.PagingParam;
import com.example.ekka.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ekka")
public class ProductController {
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
    ProductImageService productImageService;

    @Autowired
    WishListService wishListService;

    @Autowired
    CartService cartService;

    @Autowired
    ReviewService reviewService;

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = {"product"})
    public String product(@PagingParam(path = "product") ResponseDataTableDto responseDataTableDto, Model model, HttpServletRequest request) {
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

            int countWishList = wishListService.countWishList();
            int countCart = cartService.countCart();

            model.addAttribute("countWishList", countWishList);
            model.addAttribute("countCart", countCart);

            model.addAttribute("listWishListUserId", listWishListUserId);
            model.addAttribute("listCartUserId", listCartUserId);
            model.addAttribute("listGenderCategory", listGenderCategory);
            model.addAttribute("listProductColor", listProductColor);
            model.addAttribute("listProductSize", listProductSize);
            model.addAttribute("listCategory", listCategory);

            System.out.println("listCategory: "+listCategory);
            UrlDto urlDto = new UrlDto();
            urlDto.setUrl(request.getRequestURL().toString());
            model.addAttribute("urlDto", urlDto);
            productService.list(responseDataTableDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user_view/product";
    }

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping("product-details/{id}")
    public String details(@PathVariable(name = "id") int id, ProductDto productDto, Model model, HttpServletRequest request) {
        // Lấy ID của tài khoản  đa đăng nhập
        long UserId = ((UserEntity) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        List<WishListEntity> listWishListUserId = wishListService.listAllUserId(UserId);
        List<WishListEntity> listWishListProductId = wishListService.listAllProductId(id);
        List<CartEntity> listCartUserId = cartService.listAllUserId(UserId);
        List<CartEntity> listCartProductId = cartService.listAllProductId(id);
        List<ReviewEntity> listReview = reviewService.listAllProductId(id);
        List<ReviewEntity> listReviewProductAndUser = reviewService.listAllProductIdAndUserId(id, UserId);
        int countReviewProduct = reviewService.countAll(id);

        ProductEntity productEntity = productService.get(id);
        BeanUtils.copyProperties(productEntity, productDto);
        List<CategoryEntity> listCategory = categoryService.listAll();
        List<BrandEntity> listBrand = brandService.listAll();
        List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
        List<ProductImageEntity> listProductImage = productImageService.listAll();
        List<ProductSizeEntity> listProductSize = productSizeService.listAll();
        List<ProductColorEntity> listProductColor = productColorService.listAll();
        List<ProductEntity> listProductCategory = productService.listAllCategory(productEntity.getCategory().getId());


        productDto.setCategoryId(productEntity.getCategory().getId());
        productDto.setBrandId(productEntity.getBrand().getId());

        int countWishList = wishListService.countWishList();
        int countCart = cartService.countCart();

        model.addAttribute("countWishList", countWishList);
        model.addAttribute("countCart", countCart);

        model.addAttribute("listWishListUserId", listWishListUserId);
        model.addAttribute("listWishListProductId", listWishListProductId);
        model.addAttribute("listCartUserId", listCartUserId);
        model.addAttribute("listCartProductId", listCartProductId);
        model.addAttribute("listCategory", listCategory);
        System.out.println("listCategory " + listCategory);
        System.out.println("listWishListProductId " + listWishListProductId);
        System.out.println("listCartUserId " + listCartUserId);
        System.out.println("listCartProductId " + listCartProductId);
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("listGenderCategory", listGenderCategory);
        model.addAttribute("listProductImage", listProductImage);
        model.addAttribute("listProductSize", listProductSize);
        model.addAttribute("listProductColor", listProductColor);
        model.addAttribute("listReview", listReview);
        model.addAttribute("listReviewProductAndUser", listReviewProductAndUser);
        model.addAttribute("productDto", productDto);
        model.addAttribute("productEntity", productEntity);
        model.addAttribute("listProductCategory", listProductCategory);
        model.addAttribute("UserId", UserId);
        model.addAttribute("countReviewProduct", countReviewProduct);

        UrlDto urlDto = new UrlDto();
        urlDto.setUrl(request.getRequestURL().toString());
        model.addAttribute("urlDto", urlDto);
        model.addAttribute("addCartDto", new AddCartDto());
        model.addAttribute("reviewDto", new ReviewDto());

        return "user_view/product-details";
    }
}