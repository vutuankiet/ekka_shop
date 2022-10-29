package com.example.ekka.repository.category;

import com.example.ekka.entities.BrandEntity;
import com.example.ekka.entities.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
    CategoryEntity findFirstByCategoryName(String categoryName);
    CategoryEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT c FROM CategoryEntity c ORDER BY c.updated_at DESC")       // it will delete all the record with specific name
    List<CategoryEntity> findAllByUpdate_at();
}
