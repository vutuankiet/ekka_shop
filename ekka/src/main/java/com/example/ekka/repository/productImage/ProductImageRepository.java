package com.example.ekka.repository.productImage;

import com.example.ekka.entities.ProductColorEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ProductImageEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductImageRepository extends JpaRepository <ProductImageEntity, Long> {
    ProductImageEntity findFirstByImage(String image);
    ProductImageEntity findAllById(long id);
    ProductImageEntity findAllByProductId(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "DELETE FROM ProductImageEntity s WHERE s.product.id = :id")       // it will delete all the record with specific name
    int deleteByProduct_Id(@Param("id") long id);
}
