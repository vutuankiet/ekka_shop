package com.example.ekka.controller.admin;

import com.example.ekka.config.language.MessageConfig;
import com.example.ekka.dto.UserDto;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.service.UserService;
import com.example.ekka.storage.IImageService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;

@Controller
@RequestMapping("ekka/admin")
public class AuthAdminController {
    @Autowired
    MessageConfig messageConfig;

    @Autowired
    UserService userService;
    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = "profile")
    public String userProfile(UserDto userDto, Model model) {
        // Lấy ID của tài khoản  đa đăng nhập
        long id = ((UserEntity) SecurityContextHolder.getContext()
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
        System.out.println("role:"+userDto.getRole());
        model.addAttribute("userDto", userDto);

        return "auth/admin-profile";
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
                        .getAuthentication().getPrincipal()).getAvatar();
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


        return "redirect:/ekka/admin/profile/";
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
}
