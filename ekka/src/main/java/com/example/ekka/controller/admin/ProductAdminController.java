package com.example.ekka.controller.admin;

import com.example.ekka.dto.*;
import com.example.ekka.dto.ProductDto;
import com.example.ekka.entities.*;
import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.productImage.ProductImageRepository;
import com.example.ekka.service.*;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("ekka/admin/product")
public class ProductAdminController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProductImageRepository productImageRepository;
    @Autowired
    ProductService productService;

    @Autowired
    ProductColorService productColorService;

    @Autowired
    ProductImageService productImageService;

    @Autowired
    ProductSizeService productSizeService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    GenderCategoryService genderCategoryService;

    @Autowired
    BrandService brandService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list", "", "/"})
    public String list(Model model) {
        try {
            List<ProductEntity> listProduct = productService.listAllUpdatedDesc();
            List<CategoryEntity> listCategory = categoryService.listAll();
            List<BrandEntity> listBrand = brandService.listAll();
            List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
            List<ProductImageEntity> listProductImage = productImageService.listAll();
//            ProductImageEntity image = productImageRepository.findFirstByProduct(listProduct);


            model.addAttribute("listProduct", listProduct);
            model.addAttribute("listCategory", listCategory);
            model.addAttribute("listBrand", listBrand);
            model.addAttribute("listGenderCategory", listGenderCategory);
            model.addAttribute("listProductImage", listProductImage);
            model.addAttribute("productDto", new ProductDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/product/list";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("details/{id}")
    public String details(@PathVariable(name = "id") int id, ProductDto productDto, Model model) {
        ProductEntity productEntity = productService.get(id);
        BeanUtils.copyProperties(productEntity, productDto);
        List<CategoryEntity> listCategory = categoryService.listAll();
        List<BrandEntity> listBrand = brandService.listAll();
        List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
        List<ProductImageEntity> listProductImage = productImageService.listAll();
        List<ProductSizeEntity> listProductSize = productSizeService.listAll();
        List<ProductColorEntity> listProductColor = productColorService.listAll();


        productDto.setCategoryId(productEntity.getCategory().getId());
        productDto.setBrandId(productEntity.getBrand().getId());

        model.addAttribute("listCategory", listCategory);
        System.out.println("listCategory " + listCategory);
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("listGenderCategory", listGenderCategory);
        model.addAttribute("listProductImage", listProductImage);
        model.addAttribute("listProductSize", listProductSize);
        model.addAttribute("listProductColor", listProductColor);
        model.addAttribute("productDto", productDto);
        model.addAttribute("productEntity", productEntity);

        return "admin_view/product/details";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("create")
    public String create(Model model) {
        List<CategoryEntity> listCategory = categoryService.listAll();
        List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
        List<BrandEntity> listBrand = brandService.listAll();
        model.addAttribute("listCategory", listCategory);
        model.addAttribute("genderCategoryDto", listGenderCategory);
        model.addAttribute("brandDto", listBrand);
        System.out.println("ID: " + listCategory);
        System.out.println("ID: " + listGenderCategory);
        System.out.println("ID: " + listBrand);

        model.addAttribute("productDto", new ProductDto());
        return "admin_view/product/create";
    }

    @PostMapping(value = "save", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String save(@ModelAttribute("productDto") ProductDto productDto, ProductImageDto productImageDto, ProductColorDto productColorDto, ProductSizeDto productSizeDto, BindingResult bindingResult, RedirectAttributes model, Model m) {

        try {
//            System.out.println("gender_id: "+ productDto.getGenderCategoryId());
            System.out.println("productImage: " + productDto.getFileImage());

            productColorDto.setColor((productDto.getColor()));
            productSizeDto.setSize((productDto.getSize()));
            productImageDto.setImage(saveMultipleFile(productDto.getFileImage()));
            System.out.println("Images:" + productDto.getImage());
            productDto.setImage(productImageDto.getImage());
            productDto.setProductImage(productImageDto.getImage().get(0));
            System.out.println("Images:" + productDto.getImage());
            System.out.println("Images:" + productImageDto.getImage());
            System.out.println("Images:" + productDto.getProductImage());

            productService.save(productDto);
            model.addFlashAttribute("message_success", "Tạo mới product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Tạo mới product không thành công");
            return "redirect:/ekka/admin/product/create";
        }

        return "redirect:/ekka/admin/product/create";
    }

    @PostMapping(value = "delete/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String deleteProduct(@PathVariable(name = "id") int id, ProductDto productDto, RedirectAttributes model, Model m) {
        ProductEntity product = productService.get(id);
        BeanUtils.copyProperties(product, productDto);

        productDto.setCategoryId(product.getCategory().getId());
        productDto.setBrandId(product.getBrand().getId());
//
        System.out.println("id:" + id);
        try {
            productDto.setState(0);
            productService.deleteProduct(productDto);
            model.addFlashAttribute("message_success", "Xoa product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Xoa product không thành công");
        }
        System.out.println("id:" + id);


        return "redirect:/ekka/admin/product/list/";
    }

    @PostMapping(value = "restore/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String restoreProduct(@PathVariable(name = "id") int id, ProductDto productDto, RedirectAttributes model, Model m) {
        ProductEntity product = productService.get(id);
        BeanUtils.copyProperties(product, productDto);

        productDto.setCategoryId(product.getCategory().getId());
        productDto.setBrandId(product.getBrand().getId());
//
        System.out.println("id:" + id);
        try {
            productDto.setState(1);
            productService.restoreProduct(productDto);
            model.addFlashAttribute("message_success", "Xoa product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Xoa product không thành công");
        }
        System.out.println("id:" + id);

        return "redirect:/ekka/admin/product/list/";
    }

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping("/edit/{id}")
    public String Edit(@PathVariable(name = "id") int id, ProductDto productDto, CategoryDto categoryDto, Model model) {
        ProductEntity productEntity = productService.get(id);
        BeanUtils.copyProperties(productEntity, productDto);

        model.addAttribute("productDto", productDto);
        model.addAttribute("categoryDto", productEntity.getCategory());
        model.addAttribute("brandDto", productEntity.getBrand());

        List<ProductEntity> listProduct = productService.listAll();
        List<CategoryEntity> listCategory = categoryService.listAll();
        List<BrandEntity> listBrand = brandService.listAll();
        List<GenderCategoryEntity> listGenderCategory = genderCategoryService.listAll();
        List<ProductImageEntity> listProductImage = productImageService.listAll();
        List<ProductSizeEntity> listProductSize = productSizeService.listAll();
        List<ProductColorEntity> listProductColor = productColorService.listAll();

        productDto.setColor(new ArrayList<>());
        System.out.println("productDto: " + productDto.getColor());
        try {
            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (ProductColorEntity colors : listProductColor) {
                if (colors.getProduct().getId() == productDto.getId()) {
                    System.out.println("color: " + colors.getColorName());
                    testList.add(colors.getColorName());
                    System.out.println("color: " + testList);

                }
            }
            System.out.println("color: " + testList.get(0));

            if(testList.size() == 4) {
                productDto.setColorEdit1(String.valueOf(testList.get(0)));
                productDto.setColorEdit2(String.valueOf(testList.get(1)));
                productDto.setColorEdit3(String.valueOf(testList.get(2)));
                productDto.setColorEdit4(String.valueOf(testList.get(3)));
            }
            if(testList.size() == 3) {
                productDto.setColorEdit1(String.valueOf(testList.get(0)));
                productDto.setColorEdit2(String.valueOf(testList.get(1)));
                productDto.setColorEdit3(String.valueOf(testList.get(2)));
                productDto.setColorEdit4(null);
            }
            if(testList.size() == 2) {
                productDto.setColorEdit1(String.valueOf(testList.get(0)));
                productDto.setColorEdit2(String.valueOf(testList.get(1)));
                productDto.setColorEdit3(null);
                productDto.setColorEdit4(null);
            }
            if(testList.size() == 1) {
                productDto.setColorEdit1(String.valueOf(testList.get(0)));
                productDto.setColorEdit2(null);
                productDto.setColorEdit3(null);
                productDto.setColorEdit4(null);
            }


        } catch (Exception ex) {
            throw ex;
        }

        try {
            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (ProductImageEntity images : listProductImage) {
                if (images.getProduct().getId() == productDto.getId()) {
                    System.out.println("images: " + images.getImage());
                    testList.add(images.getImage());
                    System.out.println("images: " + testList);

                }
            }
            System.out.println("color: " + testList);

            productDto.setImageEdit1(String.valueOf(testList.get(0)));
            productDto.setImageEdit2(String.valueOf(testList.get(1)));
            productDto.setImageEdit3(String.valueOf(testList.get(2)));
            productDto.setImageEdit4(String.valueOf(testList.get(3)));
            productDto.setImageEdit5(String.valueOf(testList.get(4)));
            productDto.setImageEdit6(String.valueOf(testList.get(5)));
            productDto.setImageEdit7(String.valueOf(testList.get(6)));


        } catch (Exception ex) {
            throw ex;
        }

        try {
            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (ProductSizeEntity sizes : listProductSize) {
                if (sizes.getProduct().getId() == productDto.getId()) {
                    System.out.println("images: " + sizes.getSizeName());
                    testList.add(sizes.getSizeName());
                    System.out.println("images: " + testList);

                }
            }
            System.out.println("color: " + testList);
            if(testList.contains("S")){
                productDto.setSize1("S");
            }
            if(testList.contains("M")){
                productDto.setSize2("M");
            }
            if(testList.contains("L")){
                productDto.setSize3("L");
            }
            if(testList.contains("XL")){
                productDto.setSize4("XL");
            }
            if(testList.contains("XXL")){
                productDto.setSize5("XXL");
            }
System.out.println("size1: "+ productDto.getSize1());

        } catch (Exception ex) {
            throw ex;
        }
        model.addAttribute("listProduct", listProduct);
        model.addAttribute("listCategory", listCategory);
        model.addAttribute("listBrand", listBrand);
        model.addAttribute("listGenderCategory", listGenderCategory);
        model.addAttribute("listProductImage", listProductImage);
        model.addAttribute("listProductSize", listProductSize);
        model.addAttribute("listProductColor", listProductColor);

        return "admin_view/product/edit";
    }

    @PostMapping(value = "update", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String updateProduct(@ModelAttribute("productDto") ProductDto productDto, ProductImageDto productImageDto, ProductColorDto productColorDto, ProductSizeDto productSizeDto, RedirectAttributes model, Model m) {
        ProductEntity name = productRepository.findAllById(productDto.getId());
//            System.out.println("gender_id: "+ productDto.getGenderCategoryId());
        System.out.println("productImage: " + productDto.getFileImage());
        try {
            productColorDto.setColor((productDto.getColor()));
            productSizeDto.setSize((productDto.getSize()));
        } catch (Exception ex) {
            model.addFlashAttribute("message_err", "Luu file that bai!");
        }

        try {
            List<ProductImageEntity> listProductImage = productImageService.listAll();

            String[] arr = {};
            List testList = new ArrayList<>(Arrays.asList(arr));
            for (ProductImageEntity images : listProductImage) {
                if (images.getProduct().getId() == productDto.getId()) {
                    System.out.println("images: " + images.getImage());
                    testList.add(images.getImage());
                    System.out.println("images: " + testList);

                }
            }
            if(saveFile(productDto.getFileImageEdit1()) == null){
                productDto.setImageEdit1(String.valueOf(testList.get(0)));
            }
            if(saveFile(productDto.getFileImageEdit1()) != null){
                productDto.setImageEdit1(saveFile(productDto.getFileImageEdit1()));
            }
            if(saveFile(productDto.getFileImageEdit2()) == null){
                productDto.setImageEdit2(String.valueOf(testList.get(1)));
            }
            if(saveFile(productDto.getFileImageEdit2()) != null){
                productDto.setImageEdit2(saveFile(productDto.getFileImageEdit2()));
            }
            if(saveFile(productDto.getFileImageEdit3()) == null){
                productDto.setImageEdit3(String.valueOf(testList.get(2)));
            }
            if(saveFile(productDto.getFileImageEdit3()) != null){
                productDto.setImageEdit3(saveFile(productDto.getFileImageEdit3()));
            }
            if(saveFile(productDto.getFileImageEdit4()) == null){
                productDto.setImageEdit4(String.valueOf(testList.get(3)));
            }
            if(saveFile(productDto.getFileImageEdit4()) != null){
                productDto.setImageEdit4(saveFile(productDto.getFileImageEdit4()));
            }
            if(saveFile(productDto.getFileImageEdit5()) == null){
                productDto.setImageEdit5(String.valueOf(testList.get(4)));
            }
            if(saveFile(productDto.getFileImageEdit5()) != null){
                productDto.setImageEdit5(saveFile(productDto.getFileImageEdit5()));
            }
            if(saveFile(productDto.getFileImageEdit6()) == null){
                productDto.setImageEdit6(String.valueOf(testList.get(5)));
            }
            if(saveFile(productDto.getFileImageEdit6()) != null){
                productDto.setImageEdit6(saveFile(productDto.getFileImageEdit6()));
            }
            if(saveFile(productDto.getFileImageEdit7()) == null){
                productDto.setImageEdit7(String.valueOf(testList.get(6)));
            }
            if(saveFile(productDto.getFileImageEdit7()) != null){
                productDto.setImageEdit7(saveFile(productDto.getFileImageEdit7()));
            }

            String[] arrImage = {};
            List listImage = new ArrayList<>(Arrays.asList(arrImage));
            listImage.add(productDto.getImageEdit1());
            listImage.add(productDto.getImageEdit2());
            listImage.add(productDto.getImageEdit3());
            listImage.add(productDto.getImageEdit4());
            listImage.add(productDto.getImageEdit5());
            listImage.add(productDto.getImageEdit6());
            listImage.add(productDto.getImageEdit7());

            productImageDto.setImage(listImage);
            System.out.println("Images:" + productDto.getImage());
            productDto.setImage(productImageDto.getImage());
            productDto.setProductImage(productImageDto.getImage().get(0));


        } catch (IOException e) {
            e.printStackTrace();
        }
//        System.out.println("Images:" + productImageDto.getImage());
//        productDto.setImage(productImageDto.getImage());


//        ProductEntity idProduct = productRepository.findAllById(productDto.getId());
        long id = name.getId();
        System.out.println("id:" + id);
        try {
            productService.editProduct(productDto);
            model.addFlashAttribute("message_success", "Update product thành công");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Update product không thành công");
        }


        return "redirect:/ekka/admin/product/edit/"+id;
    }

    public static String FOLDER_IMAGE = "D:\\usr\\img\\k34dl\\";
    @Autowired
    IImageService imageService;

    public String saveFile(MultipartFile multipartFile) throws IOException {
        System.out.println(multipartFile);
        if (multipartFile == null || multipartFile.isEmpty()) {
            return null;
        } else {
            String fileName = imageService.save(multipartFile);
            String imageUrl = imageService.getImageUrl(fileName);

            return imageUrl;
        }

    }

    public List<String> saveMultipleFile(List<MultipartFile> files) throws IOException {
        System.out.println(files.get(0));
        if (files.get(0) == null || files.get(0).isEmpty()) {
            return null;
        } else {
            List<String> fileNames = files.stream().map(f -> {
                try {
                    return imageService.save(f);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }).collect(Collectors.toList());
            List<String> imageUrls = fileNames.stream().map(fn -> imageService.getImageUrl(fn)).collect(Collectors.toList());

            return imageUrls;
        }
    }
}
