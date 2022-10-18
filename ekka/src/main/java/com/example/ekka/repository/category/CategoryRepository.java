package com.example.ekka.repository.category;

import com.example.ekka.entities.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
    CategoryEntity findFirstByCategoryName(String categoryName);
    CategoryEntity findAllById(long id);
}
