package com.example.ekka.service;

import com.example.ekka.dto.*;
import com.example.ekka.dto.ProductDto;
import com.example.ekka.entities.*;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.repository.SearchingRepository;
import com.example.ekka.repository.brand.BrandRepository;
import com.example.ekka.repository.category.CategoryRepository;
import com.example.ekka.repository.genderCategory.GenderCategoryRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.productColor.ProductColorRepository;
import com.example.ekka.repository.productImage.ProductImageRepository;
import com.example.ekka.repository.productSize.ProductSizeRepository;
import com.example.ekka.service.email.EmailDetails;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    GenderCategoryRepository genderCategoryRepository;

    @Autowired
    ProductImageRepository productImageRepository;

    @Autowired
    ProductSizeRepository productSizeRepository;

    @Autowired
    ProductColorRepository productColorRepository;
    
    @Autowired
    BrandRepository brandRepository;

    public void save(ProductDto productDto) throws Exception {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDto, productEntity);

        if(productDto.getColor() == null || productDto.getSize() == null){
            throw new Exception();
        }

        ProductEntity name = productRepository.findFirstByProductName(productEntity.getProductName());
        System.out.println("Name: " + name);
        if (name == null || name.getCategory().getId() != productDto.getCategoryId()) {
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            productEntity.setCreated_at(timestamp);
            productEntity.setUpdated_at(timestamp);
            productEntity.setState(1);
            productEntity.setRating((float) 0);
            productEntity.setCategory(categoryRepository.findById(productDto.getCategoryId()).orElse(null));
            productEntity.setBrand(brandRepository.findById(productDto.getBrandId()).orElse(null));
            productEntity.setProductColorEntityCollection(productDto.getColor().stream().map(c -> new ProductColorEntity(null,c,productEntity,timestamp,null,1)).collect(Collectors.toList()));
            productEntity.setProductSizeEntityCollection(productDto.getSize().stream().map(s -> new ProductSizeEntity(null,s,productEntity,timestamp,null,1)).collect(Collectors.toList()));

            System.out.println("Size: "+productDto.getSize());
            System.out.println("Color: "+productDto.getColor());
            System.out.println("Image: "+productDto.getImage());
            productEntity.setProductImageEntityCollection(productDto.getImage().stream().map(i -> new ProductImageEntity(null,i,productEntity,timestamp,null,1)).collect(Collectors.toList()));
            System.out.println("Image: "+productDto.getImage());

            productRepository.save(productEntity);

            int countProductCategory = countProductCategory(productDto.getCategoryId());
            categoryRepository.changeItem(countProductCategory, productDto.getCategoryId());

            int countProductBrand = countBrand(productDto.getBrandId());
            brandRepository.changeItem(countProductBrand, productDto.getBrandId());

            ProductEntity nameproduct = productRepository.findFirstByProductName(productEntity.getProductName());
            int countProductGenderCategory = countProductGenderCategory(nameproduct.getCategory().getGenderCategory().getId());
            genderCategoryRepository.changeItem(countProductGenderCategory, nameproduct.getCategory().getGenderCategory().getId());

        } else {
            throw new Exception("Product already exist!!");
        }
    }

    public List<ProductEntity> listAll() {
        return (List<ProductEntity>) productRepository.findAll();
    }
    public int countProduct() {
        return productRepository.countAll();
    }

    public int countProductCategory(long id) {
        return productRepository.countCategory(id);
    }

    public int countProductGenderCategory(long id) {
        return productRepository.countGenderCategory(id);
    }

    public int countBrand(long id) {
        return productRepository.countBrand(id);
    }
    public List<ProductEntity> listAllUpdatedDesc() {
        return (List<ProductEntity>) productRepository.findAllByUpdate_at();
    }

    public List<ProductEntity> listAllProductByState() {
        return (List<ProductEntity>) productRepository.findAllByState();
    }
    public List<ProductEntity> listAllCategory(long id) {
        return (List<ProductEntity>) productRepository.findAllByCategoryId(id);
    }

    public List<ProductEntity> listAllProductId(long id) {
        return (List<ProductEntity>) productRepository.findAllProductById(id);
    }
    public void list(ResponseDataTableDto responseDataTableDto) throws Exception {
        responseDataTableDto.list(productRepository);
    }
    public ProductEntity get(long id) {
        return productRepository.findById(id).get();
    }

    public void deleteProduct(ProductDto productDto) throws Exception {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDto, productEntity);
        ProductEntity name = productRepository.findFirstByProductName(productDto.getProductName());

        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        productEntity.setProductName(name.getProductName());
        productEntity.setProductImage(name.getProductImage());
        productEntity.setDetails(name.getDetails());
        productEntity.setMoreInformation(name.getMoreInformation());
        productEntity.setTotalProduct(name.getTotalProduct());
        productEntity.setPriceProduct(name.getPriceProduct());
        productEntity.setDiscount(name.getDiscount());
        productEntity.setRating(name.getRating());
        productEntity.setCreated_at(name.getCreated_at());
        productEntity.setUpdated_at(timestamp);
        productEntity.setCategory(categoryRepository.findById(productDto.getCategoryId()).orElse(null));
        productEntity.setBrand(brandRepository.findById(productDto.getBrandId()).orElse(null));

        productRepository.save(productEntity);

        int countProductCategory = countProductCategory(productDto.getCategoryId());
        categoryRepository.changeItem(countProductCategory, productDto.getCategoryId());

        int countProductBrand = countBrand(productDto.getBrandId());
        brandRepository.changeItem(countProductBrand, productDto.getBrandId());

        ProductEntity nameproduct = productRepository.findFirstByProductName(productEntity.getProductName());
        int countProductGenderCategory = countProductGenderCategory(nameproduct.getCategory().getGenderCategory().getId());
        genderCategoryRepository.changeItem(countProductGenderCategory, nameproduct.getCategory().getGenderCategory().getId());

    }

    public void restoreProduct(ProductDto productDto) throws Exception {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDto, productEntity);
        ProductEntity name = productRepository.findFirstByProductName(productDto.getProductName());

        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        productEntity.setProductName(name.getProductName());
        productEntity.setProductImage(name.getProductImage());
        productEntity.setDetails(name.getDetails());
        productEntity.setMoreInformation(name.getMoreInformation());
        productEntity.setTotalProduct(name.getTotalProduct());
        productEntity.setPriceProduct(name.getPriceProduct());
        productEntity.setDiscount(name.getDiscount());
        productEntity.setRating(name.getRating());
        productEntity.setCreated_at(name.getCreated_at());
        productEntity.setUpdated_at(timestamp);
        productEntity.setCategory(categoryRepository.findById(productDto.getCategoryId()).orElse(null));
        productEntity.setBrand(brandRepository.findById(productDto.getBrandId()).orElse(null));

        productRepository.save(productEntity);

        int countProductCategory = countProductCategory(productDto.getCategoryId());
        categoryRepository.changeItem(countProductCategory, productDto.getCategoryId());

        int countProductBrand = countBrand(productDto.getBrandId());
        brandRepository.changeItem(countProductBrand, productDto.getBrandId());

        ProductEntity nameproduct = productRepository.findFirstByProductName(productEntity.getProductName());
        int countProductGenderCategory = countProductGenderCategory(nameproduct.getCategory().getGenderCategory().getId());
        genderCategoryRepository.changeItem(countProductGenderCategory, nameproduct.getCategory().getGenderCategory().getId());

    }

    public void changeTotalProduct(String total, long id) throws Exception{
        try {
            productRepository.changeTotal(total,id);
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void editProduct(ProductDto productDto) throws Exception {


        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDto, productEntity);
        ProductEntity name = productRepository.findFirstByProductName(productEntity.getProductName());
        ProductEntity id = productRepository.findAllById(productEntity.getId());
        System.out.println("Name: " + name);
        if (name == null || Objects.equals(id.getProductName(), productDto.getProductName())) {
            productSizeRepository.deleteByProduct_Id(productDto.getId());
            System.out.println("ID: "+productDto.getId());

            productColorRepository.deleteByProduct_Id(productDto.getId());
            System.out.println("ID: "+productDto.getId());

            productImageRepository.deleteByProduct_Id(productDto.getId());
            System.out.println("ok roi day!");
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            productEntity.setCreated_at(id.getCreated_at());
            productEntity.setRating(id.getRating());
            productEntity.setUpdated_at(timestamp);
            productEntity.setDiscount(productDto.getDiscount());
            productEntity.setState(id.getState());
            productEntity.setCategory(categoryRepository.findById(productDto.getCategoryId()).orElse(null));
            productEntity.setBrand(brandRepository.findById(productDto.getBrandId()).orElse(null));
            productEntity.setProductColorEntityCollection(productDto.getColor().stream().map(c -> new ProductColorEntity(null,c,productEntity,timestamp,null,1)).collect(Collectors.toList()));
            productEntity.setProductSizeEntityCollection(productDto.getSize().stream().map(s -> new ProductSizeEntity(null,s,productEntity,timestamp,null,1)).collect(Collectors.toList()));

            System.out.println("Size: "+productDto.getSize());
            System.out.println("Color: "+productDto.getColor());
            System.out.println("Image: "+productDto.getImage());
            productEntity.setProductImageEntityCollection(productDto.getImage().stream().map(i -> new ProductImageEntity(null,i,productEntity,timestamp,null,1)).collect(Collectors.toList()));
            System.out.println("Image: "+productDto.getImage());
            System.out.println("ID: "+productDto.getId());


            productRepository.save(productEntity);
        } else {
            throw new Exception("Product already exist!!");
        }

    }
}
