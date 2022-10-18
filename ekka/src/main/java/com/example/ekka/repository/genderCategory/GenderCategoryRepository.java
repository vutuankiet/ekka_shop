package com.example.ekka.repository.genderCategory;

import com.example.ekka.entities.GenderCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GenderCategoryRepository extends JpaRepository<GenderCategoryEntity, Long> {
    GenderCategoryEntity findFirstByGenderCategoryName(String genderCategoryName);
    GenderCategoryEntity findAllById(long id);
}
