package com.example.ekka.repository.productSize;

import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ProductImageEntity;
import com.example.ekka.entities.ProductSizeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ProductSizeRepository extends JpaRepository<ProductSizeEntity, Long> {
    ProductSizeEntity findFirstBySizeName(String sizeName);
    ProductSizeEntity findAllById(long id);
    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "DELETE FROM ProductSizeEntity s WHERE s.product.id = :id")       // it will delete all the record with specific name
    int deleteByProduct_Id(@Param("id") long id);

}
