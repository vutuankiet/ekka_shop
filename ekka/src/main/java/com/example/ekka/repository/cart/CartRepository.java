package com.example.ekka.repository.cart;

import com.example.ekka.entities.CartEntity;
import com.example.ekka.entities.WishListEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CartRepository extends JpaRepository<CartEntity, Long> {
    CartEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT c FROM CartEntity c WHERE c.user.id = :id  ORDER BY c.updated_at DESC")       // it will delete all the record with specific name
    List<CartEntity> findAllByUserId(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT c FROM CartEntity c WHERE c.product.id = :id  ORDER BY c.updated_at DESC")       // it will delete all the record with specific name
    List<CartEntity> findAllByProductId(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT c FROM CartEntity c WHERE c.product.id = :id and c.user.id = :UserId  ORDER BY c.updated_at DESC")       // it will delete all the record with specific name
    List<CartEntity> findAllByProductIdAndUserId(long id, long UserId);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "DELETE FROM CartEntity c WHERE c.id = :id")       // it will delete all the record with specific name
    int deleteById(@Param("id") long id);

    @Query(value = "SELECT count(c.id) FROM CartEntity c WHERE c.state = 1")
    int countAll();

    @Query(value = "SELECT count(c.id) FROM CartEntity c WHERE c.user.id = :id and c.state = 1")
    int countAllByUser(@Param("id") long id);
}
