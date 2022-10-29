package com.example.ekka.repository.product;

import com.example.ekka.entities.ProductEntity;
import com.example.ekka.repository.SearchingRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ProductRepository extends SearchingRepository<ProductEntity, Long> {
    ProductEntity findFirstByProductName(String productName);
    ProductEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT p FROM ProductEntity p ORDER BY p.updated_at DESC")       // it will delete all the record with specific name
    List<ProductEntity> findAllByUpdate_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT p FROM ProductEntity p WHERE p.category.id = :id  ORDER BY p.updated_at DESC")       // it will delete all the record with specific name
    List<ProductEntity> findAllByCategoryId(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT p FROM ProductEntity p WHERE p.id = :id  ORDER BY p.updated_at DESC")       // it will delete all the record with specific name
    List<ProductEntity> findAllProductById(long id);


    @Query(value = "SELECT count(p.id) FROM ProductEntity p WHERE p.state = 1")
    int countAll();

    @Query("select p from ProductEntity p where p.productName like %:key%")
    Page<ProductEntity> findAll(String key, Pageable pageable);
}
