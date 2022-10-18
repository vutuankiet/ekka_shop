package com.example.ekka.controller.admin;

import com.example.ekka.dto.GenderCategoryDto;
import com.example.ekka.entities.GenderCategoryEntity;
import com.example.ekka.entities.GenderCategoryEntity;
import com.example.ekka.repository.genderCategory.GenderCategoryRepository;
import com.example.ekka.service.GenderCategoryService;
import com.example.ekka.storage.IImageService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("ekka/admin/gender-category")
public class GenderCategoryAdminController {
    @Autowired
    GenderCategoryRepository genderCategoryRepository;
    @Autowired
    GenderCategoryService genderCategoryService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list","","/"})
    public String list(Model model) {
        try {
            List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
            model.addAttribute("list",listGenderCategory);
            model.addAttribute("genderCategoryDto", new GenderCategoryDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/gender-category/list";
    }

    @PostMapping(value = "save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String save(@ModelAttribute("genderCategoryDto") GenderCategoryDto genderCategoryDto, RedirectAttributes model, Model m) {
        try {
            genderCategoryDto.setGenderCategoryLogo(saveFile(genderCategoryDto.getFileGenderCategory()));
            genderCategoryService.save(genderCategoryDto);
            model.addFlashAttribute("message", "Tạo mới tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Tạo mới tài khoản không thành công");
            return "redirect:/ekka/admin/gender-category/list";
        }

        return "redirect:/ekka/admin/gender-category/list";
    }

    @PostMapping(value = "delete/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String deleteGenderCategory(@PathVariable(name = "id") int id, GenderCategoryDto genderCategoryDto, RedirectAttributes model, Model m) {
        GenderCategoryEntity genderCategory = genderCategoryService.get(id);
        BeanUtils.copyProperties(genderCategory, genderCategoryDto);
        try {
            GenderCategoryEntity name = genderCategoryRepository.findFirstByGenderCategoryName(genderCategoryDto.getGenderCategoryName());
            if(saveFile(genderCategoryDto.getFileGenderCategory()) == null){
                genderCategoryDto.setGenderCategoryLogo(name.getGenderCategoryLogo());
            }else {
                genderCategoryDto.setGenderCategoryLogo(saveFile(genderCategoryDto.getFileGenderCategory()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            genderCategoryDto.setState(0);
            genderCategoryService.deleteGenderCategory(genderCategoryDto);
            model.addFlashAttribute("message", "Xoa tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa tài khoản không thành công");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/gender-category/list/";
    }

    @PostMapping(value = "restore/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String restoreGenderCategory(@PathVariable(name = "id") int id, GenderCategoryDto genderCategoryDto, RedirectAttributes model, Model m) {
        GenderCategoryEntity genderCategory = genderCategoryService.get(id);
        BeanUtils.copyProperties(genderCategory, genderCategoryDto);
        try {
            GenderCategoryEntity name = genderCategoryRepository.findFirstByGenderCategoryName(genderCategoryDto.getGenderCategoryName());
            if(saveFile(genderCategoryDto.getFileGenderCategory()) == null){
                genderCategoryDto.setGenderCategoryLogo(name.getGenderCategoryLogo());
            }else {
                genderCategoryDto.setGenderCategoryLogo(saveFile(genderCategoryDto.getFileGenderCategory()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            genderCategoryDto.setState(1);
            genderCategoryService.restoreGenderCategory(genderCategoryDto);
            model.addFlashAttribute("message", "Khoi phuc gender category thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Khoi phuc gender category không thành công");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/gender-category/list/";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("/edit/{id}")
    public String Edit(@PathVariable(name = "id") int id,GenderCategoryDto genderCategoryDto, Model model) {
        GenderCategoryEntity genderCategoryEntity = genderCategoryService.get(id);
        BeanUtils.copyProperties(genderCategoryEntity, genderCategoryDto);
        model.addAttribute("genderCategoryDto", genderCategoryDto);

        List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
        model.addAttribute("list",listGenderCategory);
        return "admin_view/gender-category/edit";
    }

    @PostMapping(value = "update", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String updateGenderCategory(@ModelAttribute("genderCategoryDto") GenderCategoryDto genderCategoryDto, RedirectAttributes model, Model m) {
        try {
            GenderCategoryEntity name = genderCategoryRepository.findAllById(genderCategoryDto.getId());
            if(saveFile(genderCategoryDto.getFileGenderCategory()) == null){
                genderCategoryDto.setGenderCategoryLogo(name.getGenderCategoryLogo());
            }else {
                genderCategoryDto.setGenderCategoryLogo(saveFile(genderCategoryDto.getFileGenderCategory()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        GenderCategoryEntity idGenderCategory = genderCategoryRepository.findAllById(genderCategoryDto.getId());
        long id = idGenderCategory.getId();
        System.out.println("id:"+id);
        try {
            genderCategoryService.editGenderCategory(genderCategoryDto);
            model.addFlashAttribute("message", "Update gender category thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Update gender category không thành công");
        }


        return "redirect:/ekka/admin/gender-category/edit/"+id;
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
