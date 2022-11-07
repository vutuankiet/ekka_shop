package com.example.ekka.repository.genderCategory;

import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.GenderCategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface GenderCategoryRepository extends JpaRepository<GenderCategoryEntity, Long> {
    GenderCategoryEntity findFirstByGenderCategoryName(String genderCategoryName);
    GenderCategoryEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT g FROM GenderCategoryEntity g ORDER BY g.updated_at DESC")       // it will delete all the record with specific name
    List<GenderCategoryEntity> findAllByUpdate_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE GenderCategoryEntity g SET g.item = :item ,g.updated_at = current_timestamp WHERE g.id = :id")       // it will delete all the record with specific name
    int changeItem(@Param("item") int item, @Param("id") long id);
}
