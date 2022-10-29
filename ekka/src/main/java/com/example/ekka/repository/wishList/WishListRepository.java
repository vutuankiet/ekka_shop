package com.example.ekka.repository.wishList;

import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.WishListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface WishListRepository extends JpaRepository<WishListEntity, Long> {
    WishListEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT w FROM WishListEntity w WHERE w.user.id = :id  ORDER BY w.updated_at DESC")       // it will delete all the record with specific name
    List<WishListEntity> findAllByUserId(long id);
    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT w FROM WishListEntity w WHERE w.product.id = :id  ORDER BY w.updated_at DESC")       // it will delete all the record with specific name
    List<WishListEntity> findAllByProductId(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "DELETE FROM WishListEntity w WHERE w.id = :id")       // it will delete all the record with specific name
    int deleteById(@Param("id") long id);

    @Query(value = "SELECT count(w.id) FROM WishListEntity w WHERE w.state = 1")
    int countAll();
}
