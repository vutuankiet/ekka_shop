package com.example.ekka.repository.product;

import com.example.ekka.entities.GenderCategoryEntity;
import com.example.ekka.entities.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
    ProductEntity findFirstByProductName(String productName);
    ProductEntity findAllById(long id);
}
