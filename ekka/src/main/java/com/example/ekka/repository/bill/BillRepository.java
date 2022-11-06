package com.example.ekka.repository.bill;

import com.example.ekka.entities.BillEntity;
import com.example.ekka.entities.BillEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BillRepository extends JpaRepository<BillEntity, Long> {
    BillEntity findAllById(long id);
    
    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT b FROM BillEntity b ORDER BY b.updated_at DESC")       // it will delete all the record with specific name
    List<BillEntity> findAllByUpdate_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT b FROM BillEntity b WHERE b.order_code = :code order by b.updated_at desc")       // it will delete all the record with specific name
    List<BillEntity> findAllByOrder_code(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT b FROM BillEntity b WHERE b.order_code = :code and b.user.id = :UserId order by b.updated_at desc")       // it will delete all the record with specific name
    List<BillEntity> findAllByUserId(@Param("code") String code, @Param("UserId") long UserId);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT b FROM BillEntity b WHERE b.user.id = :id order by b.created_at desc")       // it will delete all the record with specific name
    List<BillEntity> findAllByUserId(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT b FROM BillEntity b WHERE b.state = 4 order by b.updated_at desc")       // it will delete all the record with specific name
    List<BillEntity> findAllByDelivered();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE BillEntity b SET b.state = 0, b.updated_at = current_timestamp WHERE b.order_code = :code")       // it will delete all the record with specific name
    int changeState0(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE BillEntity b SET b.state = 1, b.updated_at = current_timestamp WHERE b.order_code = :code")       // it will delete all the record with specific name
    int changeState1(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE BillEntity b SET b.state = 2, b.updated_at = current_timestamp WHERE b.order_code = :code")       // it will delete all the record with specific name
    int changeState2(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE BillEntity b SET b.state = 3, b.updated_at = current_timestamp WHERE b.order_code = :code")       // it will delete all the record with specific name
    int changeState3(@Param("code") String code);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE BillEntity b SET b.state = 4, b.updated_at = current_timestamp WHERE b.order_code = :code")       // it will delete all the record with specific name
    int changeState4(@Param("code") String code);

    @Query(value = "SELECT count(b.id) FROM BillEntity b WHERE b.state = 4")
    int countOrderDelivered();

    @Query(value = "SELECT count(b.id) FROM BillEntity b WHERE b.state > 0")
    int countAll();
}
