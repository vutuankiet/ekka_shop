package com.example.ekka.repository.brand;

import com.example.ekka.entities.BrandEntity;
import com.example.ekka.entities.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BrandRepository extends JpaRepository<BrandEntity, Long> {
    BrandEntity findFirstByNameBrand(String nameBrand);
    BrandEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT b FROM BrandEntity b ORDER BY b.updated_at DESC")       // it will delete all the record with specific name
    List<BrandEntity> findAllByUpdate_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT b FROM BrandEntity b where b.state = 1")       // it will delete all the record with specific name
    List<BrandEntity> findAllByState();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE BrandEntity b SET b.item = :item ,b.updated_at = current_timestamp WHERE b.id = :id")       // it will delete all the record with specific name
    int changeItem(@Param("item") int item, @Param("id") long id);

//    @Transactional //try to add this annotation
//    @Modifying      // to mark delete or update query
//    @Query(value = "UPDATE BrandEntity b SET b.item = :item ,b.updated_at = current_timestamp WHERE b.id = :id")       // it will delete all the record with specific name
//    int changeItem(@Param("item") int item, @Param("id") long id);
}
