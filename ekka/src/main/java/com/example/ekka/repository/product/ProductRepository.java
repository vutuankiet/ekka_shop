package com.example.ekka.repository.product;

import com.example.ekka.entities.ProductEntity;
import com.example.ekka.repository.SearchingRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
    @Query(value = "SELECT p FROM ProductEntity p where p.state = 1 ORDER BY p.updated_at DESC")       // it will delete all the record with specific name
    List<ProductEntity> findAllByState();

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

    @Query(value = "SELECT count(p.id) FROM ProductEntity p WHERE p.category.id = :id and p.state = 1")
    int countCategory(@Param("id") long id);

    @Query(value = "SELECT count(p.id) FROM ProductEntity p WHERE p.category.genderCategory.id = :id and p.state = 1")
    int countGenderCategory(@Param("id") long id);

    @Query(value = "SELECT count(p.id) FROM ProductEntity p WHERE p.brand.id = :id and p.state = 1")
    int countBrand(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.rating = :rating, p.updated_at = current_timestamp WHERE p.id = :id")       // it will delete all the record with specific name
    int updateRating(@Param("rating") Float rating,@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.totalProduct = :total, p.updated_at = current_timestamp WHERE p.id = :id")       // it will delete all the record with specific name
    int changeTotal(@Param("total") String total, @Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.state = 0, p.updated_at = current_timestamp WHERE p.brand.id = :id")       // it will delete all the record with specific name
    int deleteByBrand(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.state = 1, p.updated_at = current_timestamp WHERE p.brand.id = :id")       // it will delete all the record with specific name
    int restoreByBrand(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.state = 0, p.updated_at = current_timestamp WHERE p.category.id = :id")       // it will delete all the record with specific name
    int deleteByCategory(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.state = 1, p.updated_at = current_timestamp WHERE p.category.id = :id")       // it will delete all the record with specific name
    int restoreByCategory(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.state = 0, p.updated_at = current_timestamp WHERE p.category.genderCategory.id = :id")       // it will delete all the record with specific name
    int deleteByGenderCategory(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ProductEntity p SET p.state = 1, p.updated_at = current_timestamp WHERE p.category.genderCategory.id = :id")       // it will delete all the record with specific name
    int restoreByGenderCategory(@Param("id") long id);

    @Query(value = "select p from ProductEntity p where p.state= 1 and p.productName like %:key% and p.category.categoryName like %:category% and p.category.genderCategory.genderCategoryName like %:genderCategory% and p.brand.nameBrand like %:brand% and p.priceProduct > :firstPrice and p.priceProduct < :lastPrice")
    Page<ProductEntity> findAllProduct(@Param("key") String key, @Param("category") String category, @Param("genderCategory") String genderCategory, @Param("brand") String brand, @Param("firstPrice") float firstPrice, @Param("lastPrice") float lastPrice, Pageable pageable);
}
