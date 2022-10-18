package com.example.ekka.service;

import com.example.ekka.dto.ProductColorDto;
import com.example.ekka.dto.ProductSizeDto;
import com.example.ekka.entities.ProductColorEntity;
import com.example.ekka.entities.ProductImageEntity;
import com.example.ekka.entities.ProductSizeEntity;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.productColor.ProductColorRepository;
import com.example.ekka.repository.productSize.ProductSizeRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class ProductSizeService {
    @Autowired
    ProductSizeRepository productSizeRepository;

    @Autowired
    ProductRepository productRepository;

    public void save(ProductSizeDto productSizeDto) throws Exception {
        ProductSizeEntity productSizeEntity = new ProductSizeEntity();
        BeanUtils.copyProperties(productSizeDto, productSizeEntity);

        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        productSizeEntity.setCreated_at(timestamp);
        productSizeEntity.setState(1);
        productSizeEntity.setProduct(productRepository.findById(productSizeDto.getProductId()).orElse(null));

        productSizeRepository.save(productSizeEntity);
    }

    public List<ProductSizeEntity> listAll() {
        return (List<ProductSizeEntity>) productSizeRepository.findAll();
    }
}
