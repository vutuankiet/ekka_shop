package com.example.ekka.repository.contact;

import com.example.ekka.entities.ContactEntity;
import com.example.ekka.entities.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ContactRepository extends JpaRepository<ContactEntity, Long> {
    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT c FROM ContactEntity c ORDER BY c.updated_at DESC")       // it will delete all the record with specific name
    List<ContactEntity> findAllByUpdated_at();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ContactEntity c SET c.state = 0, c.updated_at = current_timestamp WHERE c.id = :id")       // it will delete all the record with specific name
    int deleteById(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ContactEntity c SET c.state = 1, c.updated_at = current_timestamp WHERE c.id = :id")       // it will delete all the record with specific name
    int restoreById(@Param("id") long id);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE ContactEntity c SET c.reply = :reply, c.state = 2, c.updated_at = current_timestamp WHERE c.id = :id")       // it will delete all the record with specific name
    int replyContactById(@Param("reply") String reply, @Param("id") long id);
}
