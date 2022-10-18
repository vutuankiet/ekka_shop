package com.example.ekka.repository.productImage;

import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ProductImageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductImageRepository extends JpaRepository <ProductImageEntity, Long> {
    ProductImageEntity findFirstByImage(String image);
    ProductImageEntity findAllById(long id);
    ProductImageEntity findAllByProduct_Id(long id);

    ProductImageEntity deleteAllByProductId(long id);
}
