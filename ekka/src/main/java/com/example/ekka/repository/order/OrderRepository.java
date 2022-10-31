package com.example.ekka.repository.order;

import com.example.ekka.entities.OrderEntity;
import com.example.ekka.entities.ReviewEntity;
import org.hibernate.validator.constraints.ru.INN;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface OrderRepository extends JpaRepository<OrderEntity, Long> {
    OrderEntity findAllById(long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT o FROM OrderEntity o ORDER BY o.updated_at DESC")       // it will delete all the record with specific name
    List<OrderEntity> findAllByUpdate_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT o FROM OrderEntity o WHERE o.order_code = :code order by o.updated_at desc")       // it will delete all the record with specific name
    List<OrderEntity> findAllByOrder_code(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT o FROM OrderEntity o WHERE o.order_code = :code and o.user.id = :UserId order by o.updated_at desc")       // it will delete all the record with specific name
    List<OrderEntity> findAllByUserId(@Param("code") String code, @Param("UserId") long UserId);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT o FROM OrderEntity o WHERE o.user.id = :id order by o.created_at desc")       // it will delete all the record with specific name
    List<OrderEntity> findAllByUserId(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT o FROM OrderEntity o WHERE o.state = 4 order by o.updated_at desc")       // it will delete all the record with specific name
    List<OrderEntity> findAllByDelivered();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE OrderEntity o SET o.state = 0, o.updated_at = current_timestamp WHERE o.order_code = :code")       // it will delete all the record with specific name
    int changeState0(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE OrderEntity o SET o.state = 1, o.updated_at = current_timestamp WHERE o.order_code = :code")       // it will delete all the record with specific name
    int changeState1(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE OrderEntity o SET o.state = 2, o.updated_at = current_timestamp WHERE o.order_code = :code")       // it will delete all the record with specific name
    int changeState2(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE OrderEntity o SET o.state = 3, o.updated_at = current_timestamp WHERE o.order_code = :code")       // it will delete all the record with specific name
    int changeState3(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE OrderEntity o SET o.state = 4, o.updated_at = current_timestamp WHERE o.order_code = :code")       // it will delete all the record with specific name
    int changeState4(@Param("code") String code);

    @Query(value = "SELECT count(o.id) FROM OrderEntity o WHERE o.state = 4")
    int countOrderDelivered();

    @Query(value = "SELECT count(o.id) FROM OrderEntity o WHERE o.state > 0")
    int countAll();
}
