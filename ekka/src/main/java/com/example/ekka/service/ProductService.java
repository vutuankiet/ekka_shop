package com.example.ekka.service;

import com.example.ekka.dto.ProductDto;
import com.example.ekka.dto.ProductDto;
import com.example.ekka.entities.*;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.repository.brand.BrandRepository;
import com.example.ekka.repository.category.CategoryRepository;
import com.example.ekka.repository.genderCategory.GenderCategoryRepository;
import com.example.ekka.repository.product.ProductRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    @Autowired
    CategoryRepository categoryRepository;
    
    @Autowired
    BrandRepository brandRepository;

    public void save(ProductDto productDto) throws Exception {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDto, productEntity);

        ProductEntity name = productRepository.findFirstByProductName(productEntity.getProductName());
        System.out.println("Name: " + name);
        if (name == null || name.getCategory().getId() != productDto.getCategoryId()) {
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            productEntity.setCreated_at(timestamp);
            productEntity.setState(1);
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
        } else {
            throw new Exception("Product da ton tai!");
        }
    }

    public List<ProductEntity> listAll() {
        return (List<ProductEntity>) productRepository.findAll();
    }

    public ProductEntity get(long id) {
        return productRepository.findById(id).get();
    }

    public void deleteProduct(ProductDto productDto) throws Exception {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDto, productEntity);
        ProductEntity name = productRepository.findFirstByProductName(productDto.getProductName());

        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("Name" + name);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        productEntity.setProductName(name.getProductName());
        productEntity.setDetails(name.getDetails());
        productEntity.setMoreInformation(name.getMoreInformation());
        productEntity.setTotalProduct(name.getTotalProduct());
        productEntity.setPriceProduct(name.getPriceProduct());
        productEntity.setDiscount(name.getDiscount());
        productEntity.setCreated_at(name.getCreated_at());
        productEntity.setUpdated_at(timestamp);
        productEntity.setCategory(categoryRepository.findById(productDto.getCategoryId()).orElse(null));
        productEntity.setBrand(brandRepository.findById(productDto.getBrandId()).orElse(null));

        productRepository.save(productEntity);

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
        productEntity.setDetails(name.getDetails());
        productEntity.setMoreInformation(name.getMoreInformation());
        productEntity.setTotalProduct(name.getTotalProduct());
        productEntity.setPriceProduct(name.getPriceProduct());
        productEntity.setDiscount(name.getDiscount());
        productEntity.setCreated_at(name.getCreated_at());
        productEntity.setUpdated_at(timestamp);
        productEntity.setCategory(categoryRepository.findById(productDto.getCategoryId()).orElse(null));
        productEntity.setBrand(brandRepository.findById(productDto.getBrandId()).orElse(null));

        productRepository.save(productEntity);

    }

    public void editProduct(ProductDto productDto) throws Exception {
        ProductEntity productEntity = new ProductEntity();
        BeanUtils.copyProperties(productDto, productEntity);
        ProductEntity name = productRepository.findFirstByProductName(productEntity.getProductName());
        ProductEntity id = productRepository.findAllById(productEntity.getId());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("name" + name);
        if (name == null || id.getCategory().getId() == productDto.getCategoryId()) {
            if (id.getCategory().getId() == productDto.getCategoryId() && !id.getProductName().equals(productDto.getProductName())) {
                Long datetime = System.currentTimeMillis();
                Timestamp timestamp = new Timestamp(datetime);
                productEntity.setCreated_at(id.getCreated_at());
                productEntity.setUpdated_at(timestamp);
                productEntity.setState(id.getState());
                productEntity.setCategory(categoryRepository.findById(productDto.getCategoryId()).orElse(null));

//        userDAO.save(userDto);

                productRepository.save(productEntity);
            }else {
                throw new Exception("Product da ton tai!");
            }
        } else {
            throw new Exception("Category da ton tai!");
        }

    }
}
