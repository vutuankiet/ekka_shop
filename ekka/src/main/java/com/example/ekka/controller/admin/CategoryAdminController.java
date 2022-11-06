package com.example.ekka.controller.admin;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.GenderCategoryDto;
import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.GenderCategoryEntity;
import com.example.ekka.repository.category.CategoryRepository;
import com.example.ekka.service.CategoryService;
import com.example.ekka.service.GenderCategoryService;
import com.example.ekka.storage.IImageService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("ekka/admin/category")
public class CategoryAdminController {
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    CategoryService categoryService;

    @Autowired
    GenderCategoryService genderCategoryService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list","","/"})
    public String list(Model model) {
        try {
            List<CategoryEntity> listCategory = categoryService.listAllUpdatedDesc();
            List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAllUpdatedDesc();
            model.addAttribute("listGender",listGenderCategory);
            model.addAttribute("list",listCategory);
            model.addAttribute("categoryDto", new CategoryDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/category/list";
    }

    @PostMapping(value = "save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String save(@ModelAttribute("categoryDto") CategoryDto categoryDto, RedirectAttributes model, Model m) {
        try {
            System.out.println("gender_id: "+ categoryDto.getGenderCategoryId());
            categoryDto.setCategoryLogo(saveFile(categoryDto.getFileCategory()));
            categoryService.save(categoryDto);
            model.addFlashAttribute("message_success", "Create new category successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "New category creation failed");
            return "redirect:/ekka/admin/category/list";
        }

        return "redirect:/ekka/admin/category/list";
    }

    @PostMapping(value = "delete/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String deleteCategory(@PathVariable(name = "id") int id, CategoryDto categoryDto, RedirectAttributes model, Model m) {
        CategoryEntity category = categoryService.get(id);
        BeanUtils.copyProperties(category, categoryDto);
        try {
            CategoryEntity name = categoryRepository.findFirstByCategoryName(categoryDto.getCategoryName());
            categoryDto.setGenderCategoryId(category.getGenderCategory().getId());
            if(saveFile(categoryDto.getFileCategory()) == null){
                categoryDto.setCategoryLogo(name.getCategoryLogo());
            }else {
                categoryDto.setCategoryLogo(saveFile(categoryDto.getFileCategory()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            categoryDto.setState(0);
            categoryService.deleteCategory(categoryDto);
            model.addFlashAttribute("message_success", "Delete category successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Delete category failed");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/category/list/";
    }

    @PostMapping(value = "restore/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String restoreCategory(@PathVariable(name = "id") int id, CategoryDto categoryDto, RedirectAttributes model, Model m) {
        CategoryEntity category = categoryService.get(id);
        BeanUtils.copyProperties(category, categoryDto);
        try {
            CategoryEntity name = categoryRepository.findFirstByCategoryName(categoryDto.getCategoryName());
            categoryDto.setGenderCategoryId(category.getGenderCategory().getId());
            if(saveFile(categoryDto.getFileCategory()) == null){
                categoryDto.setCategoryLogo(name.getCategoryLogo());
            }else {
                categoryDto.setCategoryLogo(saveFile(categoryDto.getFileCategory()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            categoryDto.setState(1);
            categoryService.restoreCategory(categoryDto);
            model.addFlashAttribute("message_success", "Category recovery successful");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Category restore failed");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/category/list/";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("/edit/{id}")
    public String Edit(@PathVariable(name = "id") int id,CategoryDto categoryDto, GenderCategoryDto genderCategoryDto, Model model) {
        CategoryEntity categoryEntity = categoryService.get(id);

        System.out.println("gender category: "+categoryEntity.getGenderCategory());
//        GenderCategoryEntity genderCategoryEntity = genderCategoryService.get(categoryEntity.getId());
        BeanUtils.copyProperties(categoryEntity, categoryDto);
//        BeanUtils.copyProperties(genderCategoryEntity, genderCategoryDto);

//        categoryDto.setGenderCategoryDtoList(categoryEntity.getGenderCategory());
//        System.out.println("genderCategory: "+categoryDto.getGenderCategoryDtoList());

        model.addAttribute("categoryDto", categoryDto);
        model.addAttribute("genderCategoryDto", categoryEntity.getGenderCategory());
//        model.addAttribute("genderCategoryDto", genderCategoryDto);

        List<CategoryEntity> listCategory = categoryService.listAll();
        List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
        model.addAttribute("listGender",listGenderCategory);
        System.out.println("ListGender: " + listGenderCategory);
        System.out.println("genderCategoryDto: " + categoryEntity.getGenderCategory());
        model.addAttribute("list",listCategory);
        return "admin_view/category/edit";
    }

    @PostMapping(value = "update", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String updateCategory(@ModelAttribute("categoryDto") CategoryDto categoryDto, RedirectAttributes model, Model m) {
        try {
            CategoryEntity name = categoryRepository.findAllById(categoryDto.getId());
            if(saveFile(categoryDto.getFileCategory()) == null){
                categoryDto.setCategoryLogo(name.getCategoryLogo());
            }else {
                categoryDto.setCategoryLogo(saveFile(categoryDto.getFileCategory()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        CategoryEntity idCategory = categoryRepository.findAllById(categoryDto.getId());
        long id = idCategory.getId();
        System.out.println("id:"+id);
        try {
            categoryService.editCategory(categoryDto);
            model.addFlashAttribute("message_success", "Update category successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Category update failed");
        }


        return "redirect:/ekka/admin/category/edit/"+id;
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
