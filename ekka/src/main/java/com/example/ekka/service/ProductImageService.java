package com.example.ekka.service;

import com.example.ekka.dto.ProductColorDto;
import com.example.ekka.dto.ProductImageDto;
import com.example.ekka.entities.GenderCategoryEntity;
import com.example.ekka.entities.ProductColorEntity;
import com.example.ekka.entities.ProductImageEntity;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.productColor.ProductColorRepository;
import com.example.ekka.repository.productImage.ProductImageRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class ProductImageService {
    @Autowired
    ProductImageRepository productImageRepository;

    @Autowired
    ProductRepository productRepository;

    public void save(ProductImageDto productImageDto) throws Exception {
        ProductImageEntity productImageEntity = new ProductImageEntity();
        BeanUtils.copyProperties(productImageDto, productImageEntity);

        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        productImageEntity.setCreated_at(timestamp);
        productImageEntity.setUpdated_at(timestamp);
        productImageEntity.setState(1);
        productImageEntity.setProduct(productRepository.findById(productImageDto.getProductId()).orElse(null));

        productImageRepository.save(productImageEntity);
    }

    public List<ProductImageEntity> listAll() {
        return (List<ProductImageEntity>) productImageRepository.findAll();
    }
}
