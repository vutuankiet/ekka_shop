package com.example.ekka.controller.backend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.ekka.dto.ChangePasswordDto;
import com.example.ekka.dto.ResponseDataTableDto;
import com.example.ekka.dto.ResponseDto;
import com.example.ekka.dto.UserDto;
import com.example.ekka.paging.PagingParam;
import com.example.ekka.service.UserService;
import com.example.ekka.storage.IImageService;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Objects;

@Controller
@RequestMapping("/backend/user")
public class UserController1 {

    //1: Tổng quan
    //2: triển khai code như thế nào?
    //3: Nó có những chúc năng gì
    //4: để custom lại thì sẽ làm như thế nào?

//    Đề tài:
//    1: Validation trong Springboot
//    2: Validation sử dụng jquery
    @Autowired
    UserService userService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "user/create";
    }
    //quyền USER, ADMIN được vào trang này
    @GetMapping("list")
    public String list(@PagingParam(path = "user") ResponseDataTableDto responseDataTableDto) {
        try {
//            userService.list(responseDataTableDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/list";
    }

    @PostMapping(value = "save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String save(@Valid @ModelAttribute("userDto") UserDto userDto,
                       BindingResult bindingResult, RedirectAttributes model, Model m) {
        if (!Objects.equals(userDto.getPassword(), userDto.getRePassword())) {
            bindingResult.rejectValue("rePassword","error.userDto", "Mật khẩu không trùng khớp");
        }
        if (bindingResult.hasErrors()) {
            return "user/create";
        }
        try {
            userDto.setAvatar(saveFile(userDto.getFileImage()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            userService.save(userDto);
            model.addFlashAttribute("message", "Tạo mới tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Tạo mới tài khoản không thành công");
        }

        return "redirect:/backend/user/create";
    }

    @GetMapping("change-password")
    public String changePassword(Model model) {
        model.addAttribute("user", new ChangePasswordDto());
        return "user/change-password";
    }

    @PostMapping(value = "change-password", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String changePasswordSave(@Valid @ModelAttribute("user") ChangePasswordDto userDto,
                       BindingResult bindingResult, RedirectAttributes model, Model m) {
        if (!Objects.equals(userDto.getPassword(), userDto.getRePassword())) {
            bindingResult.rejectValue("rePassword","error.userDto", "Mật khẩu không trùng khớp");
        }
        if (bindingResult.hasErrors()) {
            return "user/change-password";
        }
        // Lấy ID của tài khoản  đa đăng nhập
        ResponseDto responseDto = userService.changePassword(userDto);
        model.addFlashAttribute("messsage", responseDto.getMessage());

        return "redirect:/backend/user/change-password";
    }

    public static String FOLDER_IMAGE = "D:\\usr\\img\\k34dl\\";
    @Autowired
    IImageService imageService;
    public String saveFile(MultipartFile multipartFile) throws IOException {
        String fileName = imageService.save(multipartFile);
        String imageUrl = imageService.getImageUrl(fileName);

        return imageUrl;

        /*if (multipartFile == null || multipartFile.isEmpty()) return null;
        String fileName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        Path uploadPath = Paths.get(FOLDER_IMAGE);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        try (InputStream inputStream = multipartFile.getInputStream()) {
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
            return fileName;
        } catch (IOException ioe) {
        }
        return null;*/
    }
}
