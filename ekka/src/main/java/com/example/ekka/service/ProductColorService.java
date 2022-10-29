package com.example.ekka.service;

import com.example.ekka.dto.ProductColorDto;
import com.example.ekka.dto.ProductDto;
import com.example.ekka.entities.ProductColorEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ProductSizeEntity;
import com.example.ekka.repository.brand.BrandRepository;
import com.example.ekka.repository.category.CategoryRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.productColor.ProductColorRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class ProductColorService {
    @Autowired
    ProductColorRepository productColorRepository;

    @Autowired
    ProductRepository productRepository;

    public void save(ProductColorDto productColorDto) throws Exception {
        ProductColorEntity productColorEntity = new ProductColorEntity();
        BeanUtils.copyProperties(productColorDto, productColorEntity);

            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            productColorEntity.setCreated_at(timestamp);
            productColorEntity.setUpdated_at(timestamp);
            productColorEntity.setState(1);
            productColorEntity.setProduct(productRepository.findById(productColorDto.getProductId()).orElse(null));

            productColorRepository.save(productColorEntity);
    }

    public List<ProductColorEntity> listAll() {
        return (List<ProductColorEntity>) productColorRepository.findAll();
    }
}
