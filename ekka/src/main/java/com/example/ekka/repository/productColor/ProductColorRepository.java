package com.example.ekka.repository.productColor;

import com.example.ekka.entities.ProductColorEntity;
import com.example.ekka.entities.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductColorRepository extends JpaRepository<ProductColorEntity, Long> {
    ProductColorEntity findFirstByColorName(String colorName);
    ProductColorEntity findAllById(long id);
}
