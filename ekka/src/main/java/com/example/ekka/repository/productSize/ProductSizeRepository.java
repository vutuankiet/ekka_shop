package com.example.ekka.repository.productSize;

import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ProductSizeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductSizeRepository extends JpaRepository<ProductSizeEntity, Long> {
    ProductSizeEntity findFirstBySizeName(String sizeName);
    ProductSizeEntity findAllById(long id);
}
