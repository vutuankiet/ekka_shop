package com.example.ekka.controller;

import com.example.ekka.dto.UserDto;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.service.CartService;
import com.example.ekka.service.WishListService;
import com.example.ekka.storage.IImageService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.ekka.config.language.MessageConfig;
import com.example.ekka.dto.ChangePasswordDto;
import com.example.ekka.dto.ResponseDto;
import com.example.ekka.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Objects;
import java.util.Random;

@Controller
@RequestMapping("/ekka")
public class AuthController {
    @Autowired
    MessageConfig messageConfig;

    @Autowired
    UserService userService;

    @Autowired
    WishListService wishListService;

    @Autowired
    CartService cartService;


    @GetMapping("login")
    public String login(Model model, @RequestParam(required = false) String error) {
//// Lấy ID của tài khoản  đa đăng nhập
//        long id = ((UserEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
//                .getId();
//        System.out.println("day la:" + id);
//        if (id != null) {
//            return "redirect:/ekka";
//        } else {
            if (error != null) model.addAttribute("message", messageConfig.getMessage(error));
            return "auth/login";
//        }
    }

    @GetMapping("register")
    public String register(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "auth/register";
    }

    @PostMapping(value = "save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String save(@Valid @ModelAttribute("userDto") UserDto userDto,
                       BindingResult bindingResult, RedirectAttributes model, Model m) {
        if (!Objects.equals(userDto.getPassword(), userDto.getRePassword())) {
            bindingResult.rejectValue("rePassword","error.userDto", "Mật khẩu không trùng khớp");
        }
        if (bindingResult.hasErrors()) {
            return "auth/register";
        }
        try {
            String[] avatar = {
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/quickdraw-default.png?alt=media&token=3e24e12b-99d1-44d7-a0a8-e5b4f67a5284",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/75593060.png?alt=media&token=eb6d943e-b849-4c61-9bfc-f3a5ac0197e9",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/pull-shark-default.png?alt=media&token=d8a867e5-8560-4b47-892b-01511d4b82b9",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/1.png?alt=media&token=fba4d923-b4f7-4681-8704-3cb53260ede2",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.png?alt=media&token=1b86cbf8-9616-4cd2-9381-d99aff22736b",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/3.png?alt=media&token=6fffe950-4ced-475f-a11a-5945854435a5",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/4.png?alt=media&token=408b465a-b038-4806-ba9a-32dfa0dc3d06",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/5.png?alt=media&token=a08475a1-b557-4453-af45-7b0878f577c1",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/6.png?alt=media&token=1c7a2434-b521-47fe-acf4-358657acb7ea",
            "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.png?alt=media&token=1820f2f9-f4fa-4b3b-96b8-acd92cce8216",
            };
//            Random random = new Random();
//            int index = random.nextInt(avatar.length);
            int index = new Random().nextInt(avatar.length);
            String random = (avatar[index]);
            userDto.setAvatar(random);

            String[] background_profile = {
                    "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.jpg?alt=media&token=fc622850-1f91-48d6-ba94-443e5c59bf9c",
                    "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf",
                    "https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584",
            };
//            Random random = new Random();
//            int index = random.nextInt(avatar.length);
            int index_bg = new Random().nextInt(background_profile.length);
            String random_bg = (background_profile[index_bg]);
            userDto.setBackground_profile(random_bg);
            userService.save(userDto);
            model.addFlashAttribute("message", "Tạo mới tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Tạo mới tài khoản không thành công");
            model.addFlashAttribute("messageEmail", e.getMessage());
            return "redirect:/ekka/register";
        }

        return "redirect:/ekka/login";
    }

    @GetMapping("forgot-password")
    public String forgotPassword(Model model) {
        return "auth/forgot-password";
    }

    @PostMapping(value = "forgot-password")
    public String forgotPasswordForm(Model model, @RequestParam String email) {
        ResponseDto responseDto = userService.forgotPassword(email);
        model.addAttribute("message", responseDto.getMessage());
        return "auth/forgot-password";
    }

    @GetMapping(value = "user-verify")
    public String userVerify(Model model) {
        model.addAttribute("user", new ChangePasswordDto());
        return "auth/user-verify";
    }

    @PostMapping(value = "user-verify", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String createform(@ModelAttribute("user") ChangePasswordDto userDto, BindingResult bindingResult,
                             RedirectAttributes model, Model m) throws Exception {
        if (!Objects.equals(userDto.getPassword(), userDto.getRePassword())) {
            bindingResult.rejectValue("rePassword","error.userDto", "Mật khẩu không trùng khớp");
        }
        if (bindingResult.hasErrors()) {
            return "auth/user-verify";
        }
        ResponseDto result = userService.verifyForgotPassword(userDto);
        model.addFlashAttribute("message", result.getMessage());
        return "redirect:/ekka/login";
    }

    //quyền USER được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_USER')")
    @GetMapping(value = "profile")
    public String userProfile(UserDto userDto, Model model) {
        int countWishList = wishListService.countWishList();
        int countCart = cartService.countCart();

        model.addAttribute("countWishList", countWishList);
        model.addAttribute("countCart", countCart);

        // Lấy ID của tài khoản  đa đăng nhập
        long id = ((UserEntity)SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getId();
        UserEntity user = userService.get(id);
        BeanUtils.copyProperties(user, userDto);
        ((UserEntity)SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).setFullName(userDto.getFullName());
        ((UserEntity)SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).setPhone(userDto.getPhone());
        ((UserEntity)SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).setAddress(userDto.getAddress());
        ((UserEntity)SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).setAvatar(userDto.getAvatar());
        ((UserEntity)SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).setBackground_profile(userDto.getBackground_profile());
        model.addAttribute("userDto", userDto);

        return "auth/profile";
    }

    @PostMapping(value = "update", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String updateProfile(@ModelAttribute("userDto") UserDto userDto, RedirectAttributes model, Model m) {
        try {
            if(saveFile(userDto.getFileImage()) == null){
                String avatar = ((UserEntity)SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal()).getAvatar();
                userDto.setAvatar(avatar);
            }else {
                userDto.setAvatar(saveFile(userDto.getFileImage()));
            }
            if(saveFile(userDto.getFileImageBackground()) == null) {
                String background_profile = ((UserEntity)SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal()).getBackground_profile();
                userDto.setBackground_profile(background_profile);
            }else {
                userDto.setBackground_profile(saveFile(userDto.getFileImageBackground()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            userService.update(userDto);
            model.addFlashAttribute("message", "Tạo mới tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Tạo mới tài khoản không thành công");
        }


        return "redirect:/ekka/profile/";
    }

    public static String FOLDER_IMAGE = "D:\\usr\\img\\k34dl\\";
    @Autowired
    IImageService imageService;
    public String saveFile(MultipartFile multipartFile) throws IOException {
        System.out.println(multipartFile);
        if(multipartFile == null || multipartFile.isEmpty()){
            return null;
        }else {
            String fileName = imageService.save(multipartFile);
            String imageUrl = imageService.getImageUrl(fileName);

            return imageUrl;
        }

    }
//
//    @GetMapping(value = "user-active/{token}")
//    public String userActive(RedirectAttributes model, @PathVariable String token, @RequestParam String email){
//        ResponseDto responseDto = userService.userActive(token, email);
//        model.addFlashAttribute("message", responseDto.getMessage());
//        return "redirect:/login";
//    }
}
