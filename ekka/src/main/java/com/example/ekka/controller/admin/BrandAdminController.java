package com.example.ekka.controller.admin;

import com.example.ekka.dto.BrandDto;
import com.example.ekka.dto.UserDto;
import com.example.ekka.entities.BrandEntity;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.repository.brand.BrandRepository;
import com.example.ekka.service.BrandService;
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

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("ekka/admin/brand")
public class BrandAdminController {

    @Autowired
    BrandRepository brandRepository;
    @Autowired
    BrandService brandService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list","","/"})
    public String list(Model model) {
        try {
            List<BrandEntity> listBrand = brandService.listAll();
            model.addAttribute("list",listBrand);
            model.addAttribute("brandDto", new BrandDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/brand/list";
    }

    @PostMapping(value = "save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String save(@ModelAttribute("brandDto") BrandDto brandDto, RedirectAttributes model, Model m) {
        try {
            brandDto.setLogo(saveFile(brandDto.getFileLogo()));
            brandService.save(brandDto);
            model.addFlashAttribute("message", "Tạo mới tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Tạo mới tài khoản không thành công");
            return "redirect:/ekka/admin/brand/list";
        }

        return "redirect:/ekka/admin/brand/list";
    }

    @PostMapping(value = "delete/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String deleteBrand(@PathVariable(name = "id") int id, BrandDto brandDto, RedirectAttributes model, Model m) {
        BrandEntity brand = brandService.get(id);
        BeanUtils.copyProperties(brand, brandDto);
        try {
            BrandEntity name = brandRepository.findFirstByNameBrand(brandDto.getNameBrand());
            if(saveFile(brandDto.getFileLogo()) == null){
                brandDto.setLogo(name.getLogo());
            }else {
                brandDto.setLogo(saveFile(brandDto.getFileLogo()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            brandDto.setState(0);
            brandService.deleteBrand(brandDto);
            model.addFlashAttribute("message", "Xoa tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Xoa tài khoản không thành công");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/brand/list/";
    }

    @PostMapping(value = "restore/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String restoreBrand(@PathVariable(name = "id") int id, BrandDto brandDto, RedirectAttributes model, Model m) {
        BrandEntity brand = brandService.get(id);
        BeanUtils.copyProperties(brand, brandDto);
        try {
            BrandEntity name = brandRepository.findFirstByNameBrand(brandDto.getNameBrand());
            if(saveFile(brandDto.getFileLogo()) == null){
                brandDto.setLogo(name.getLogo());
            }else {
                brandDto.setLogo(saveFile(brandDto.getFileLogo()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("id:"+id);
        try {
            brandDto.setState(1);
            brandService.restoreBrand(brandDto);
            model.addFlashAttribute("message", "Khoi phuc tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Khoi phuc tài khoản không thành công");
        }
        System.out.println("id:"+id);


        return "redirect:/ekka/admin/brand/list/";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("/edit/{id}")
    public String Edit(@PathVariable(name = "id") int id,BrandDto brandDto, Model model) {
        BrandEntity brand = brandService.get(id);
        BeanUtils.copyProperties(brand, brandDto);
        model.addAttribute("brandDto", brandDto);

        List<BrandEntity> listBrand = brandService.listAll();
        model.addAttribute("list",listBrand);
        return "admin_view/brand/edit";
    }

    @PostMapping(value = "update", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String updateBrand(@ModelAttribute("brandDto") BrandDto brandDto, RedirectAttributes model, Model m) {
        try {
            BrandEntity name = brandRepository.findAllById(brandDto.getId());
            if(saveFile(brandDto.getFileLogo()) == null){
                brandDto.setLogo(name.getLogo());
            }else {
                brandDto.setLogo(saveFile(brandDto.getFileLogo()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        BrandEntity idBrand = brandRepository.findAllById(brandDto.getId());
        long id = idBrand.getId();
        System.out.println("id:"+id);
        try {
            brandService.editBrand(brandDto);
            model.addFlashAttribute("message", "Update tài khoản thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message", "Update tài khoản không thành công");
        }


        return "redirect:/ekka/admin/brand/edit/"+id;
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
