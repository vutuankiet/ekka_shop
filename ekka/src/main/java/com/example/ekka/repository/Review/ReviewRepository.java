package com.example.ekka.repository.Review;

import com.example.ekka.entities.OrderEntity;
import com.example.ekka.entities.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ReviewRepository extends JpaRepository<ReviewEntity, Long> {
    ReviewEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT r FROM ReviewEntity r ORDER BY r.updated_at DESC")       // it will delete all the record with specific name
    List<ReviewEntity> findAllByUpdated_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT r FROM ReviewEntity r where r.product.id = :id ORDER BY r.updated_at DESC")       // it will delete all the record with specific name
    List<ReviewEntity> findAllByProductId(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT r FROM ReviewEntity r where r.product.id = :id and r.user.id = :user ORDER BY r.updated_at DESC")       // it will delete all the record with specific name
    List<ReviewEntity> findAllByProductIdAndUserId(@Param("id") long id,@Param("user") long user);

    @Query(value = "SELECT count(r.id) FROM ReviewEntity r WHERE r.product.id = :id")
    int countAll(@Param("id") long id);
}
