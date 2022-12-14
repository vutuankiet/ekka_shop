package com.example.ekka.repository.category;

import com.example.ekka.entities.BrandEntity;
import com.example.ekka.entities.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
    CategoryEntity findFirstByCategoryName(String categoryName);
    CategoryEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT c FROM CategoryEntity c ORDER BY c.updated_at DESC")       // it will delete all the record with specific name
    List<CategoryEntity> findAllByUpdate_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT c FROM CategoryEntity c where c.state = 1")       // it will delete all the record with specific name
    List<CategoryEntity> findAllByState();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE CategoryEntity c SET c.item = :item ,c.updated_at = current_timestamp WHERE c.id = :id")       // it will delete all the record with specific name
    int changeItem(@Param("item") int item, @Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE CategoryEntity c SET c.state = 0, c.updated_at = current_timestamp WHERE c.genderCategory.id = :id")       // it will delete all the record with specific name
    int deleteByGenderCategory(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE CategoryEntity c SET c.state = 1, c.updated_at = current_timestamp WHERE c.genderCategory.id = :id")       // it will delete all the record with specific name
    int restoreByGenderCategory(@Param("id") long id);
}
