package com.example.ekka.controller.admin;

import com.example.ekka.dto.ResponseDataTableDto;
import com.example.ekka.dto.UrlDto;
import com.example.ekka.dto.UserDto;
import com.example.ekka.entities.BillEntity;
import com.example.ekka.entities.OrderEntity;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.paging.PagingParam;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.service.BillService;
import com.example.ekka.service.OrderService;
import com.example.ekka.service.UserService;
import com.example.ekka.storage.IImageService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.Random;

@Controller
@RequestMapping("/ekka/admin/user")
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    OrderService orderService;

    @Autowired
    BillService billService;

    //quyền ADMIN được vào trang này
//    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
//    @GetMapping("create")
//    public String create(Model model) {
//        model.addAttribute("userDto", new UserDto());
//        return "user/create";
//    }
    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list","","/"})
    public String list(Model model, HttpServletRequest request) {
        try {
            List<UserEntity> listCustomer = userService.listAllUpdatedUser();
            model.addAttribute("list",listCustomer);
            model.addAttribute("userDto", new UserDto());

            UrlDto urlDto = new UrlDto();
            urlDto.setUrl(request.getRequestURL().toString());
            model.addAttribute("urlDto", urlDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/user/list";
    }

    @PostMapping(value = "save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String save(@Valid @ModelAttribute("userDto") UserDto userDto,
                       BindingResult bindingResult, RedirectAttributes model, Model m) {
        if (!Objects.equals(userDto.getPassword(), userDto.getRePassword())) {
            bindingResult.rejectValue("rePassword","error.userDto", "Mật khẩu không trùng khớp");
        }
        if (bindingResult.hasErrors()) {
            return "auth/user/list";
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
            model.addFlashAttribute("message_success", "New user created successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "New user creation failed");
            model.addFlashAttribute("messageEmail", e.getMessage());
            return "redirect:/ekka/admin/user/list";
        }

        return "redirect:/ekka/admin/user/list";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("/details/{id}")
    public String Edit(@PathVariable(name = "id") int id,UserDto userDto, Model model) {
        UserEntity user = userService.get(id);
        BeanUtils.copyProperties(user, userDto);
        model.addAttribute("userDto", userDto);

        List<UserEntity> listCustomer = userService.listAll();
        List<BillEntity> listBill = billService.findByUserId(id);
        List<OrderEntity> listOrder = orderService.findByUserId(id);


        model.addAttribute("list",listCustomer);
        model.addAttribute("listBill",listBill);
        model.addAttribute("listOrder",listOrder);
        return "admin_view/user/details";
    }

    @PostMapping(value = "update", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String updateUser(@ModelAttribute("userDto") UserDto userDto, RedirectAttributes model, Model m) {
        try {
            UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
            if(saveFile(userDto.getFileImage()) == null){
                userDto.setAvatar(email.getAvatar());
            }else {
                userDto.setAvatar(saveFile(userDto.getFileImage()));
            }
            if(saveFile(userDto.getFileImageBackground()) == null) {
                userDto.setBackground_profile(email.getBackground_profile());
            }else {
                userDto.setBackground_profile(saveFile(userDto.getFileImageBackground()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        long id = email.getId();
        System.out.println("id:"+id);
        try {
            userService.editUser(userDto);
            model.addFlashAttribute("message_success", "User update successful");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "User update failed");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/user/details/"+id;
    }

    @PostMapping(value = "delete", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String detailsDeleteUser(@ModelAttribute("userDto") UserDto userDto, RedirectAttributes model, Model m) {
        try {
            UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
            if(saveFile(userDto.getFileImage()) == null){
                userDto.setAvatar(email.getAvatar());
            }else {
                userDto.setAvatar(saveFile(userDto.getFileImage()));
            }
            if(saveFile(userDto.getFileImageBackground()) == null) {
                userDto.setBackground_profile(email.getBackground_profile());
            }else {
                userDto.setBackground_profile(saveFile(userDto.getFileImageBackground()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        long id = email.getId();
        System.out.println("id:"+id);
        try {
            userDto.setState(0);
            userService.deleteUser(userDto);
            model.addFlashAttribute("message_success", "Delete user successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "User deletion failed");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/user/details/"+id;
    }

    @PostMapping(value = "restore", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String detailsRestoreUser(@ModelAttribute("userDto") UserDto userDto, RedirectAttributes model, Model m) {
        try {
            UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
            if(saveFile(userDto.getFileImage()) == null){
                userDto.setAvatar(email.getAvatar());
            }else {
                userDto.setAvatar(saveFile(userDto.getFileImage()));
            }
            if(saveFile(userDto.getFileImageBackground()) == null) {
                userDto.setBackground_profile(email.getBackground_profile());
            }else {
                userDto.setBackground_profile(saveFile(userDto.getFileImageBackground()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        long id = email.getId();
        System.out.println("id:"+id);
        try {
            userDto.setState(1);
            userService.restoreUser(userDto);
            model.addFlashAttribute("message_success", "User recovery successful");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "User recovery failed");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/user/details/"+id;
    }

    @PostMapping(value = "delete/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String deleteUser(@PathVariable(name = "id") int id, UserDto userDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        UserEntity user = userService.get(id);
        BeanUtils.copyProperties(user, userDto);
        try {
            UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
            if(saveFile(userDto.getFileImage()) == null){
                userDto.setAvatar(email.getAvatar());
            }else {
                userDto.setAvatar(saveFile(userDto.getFileImage()));
            }
            if(saveFile(userDto.getFileImageBackground()) == null) {
                userDto.setBackground_profile(email.getBackground_profile());
            }else {
                userDto.setBackground_profile(saveFile(userDto.getFileImageBackground()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            userDto.setState(0);
            userService.deleteUser(userDto);
            model.addFlashAttribute("message_success", "Delete user successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "User deletion failed");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/user/list/";
    }

    @PostMapping(value = "restore/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String restoreUser(@PathVariable(name = "id") int id, UserDto userDto, @ModelAttribute("urlDto") UrlDto urlDto, RedirectAttributes model, Model m) {
        UserEntity user = userService.get(id);
        BeanUtils.copyProperties(user, userDto);
        try {
            UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
            if(saveFile(userDto.getFileImage()) == null){
                userDto.setAvatar(email.getAvatar());
            }else {
                userDto.setAvatar(saveFile(userDto.getFileImage()));
            }
            if(saveFile(userDto.getFileImageBackground()) == null) {
                userDto.setBackground_profile(email.getBackground_profile());
            }else {
                userDto.setBackground_profile(saveFile(userDto.getFileImageBackground()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            userDto.setState(1);
            userService.deleteUser(userDto);
            model.addFlashAttribute("message_success", "User recovery successful");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "User recovery failed");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/user/list/";
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
