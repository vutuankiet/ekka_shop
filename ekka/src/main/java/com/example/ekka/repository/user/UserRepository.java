package com.example.ekka.repository.user;

import com.example.ekka.entities.OrderEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.repository.SearchingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

// so sánh jpa, spring data jpa và herbinate
public interface UserRepository extends JpaRepository<UserEntity, Long>, UserRepositoryCustom {
    List<UserEntity> findAllByEmail(String email);
    @Query(value = "select u from UserEntity u where u.email =:email")
    List<UserEntity> findAllByEmail2(String email);
    @Query(value = "SELECT * FROM USER where EMAIL = ?1", nativeQuery = true)
    List<UserEntity> findAllByEmail3(String email);

//    @Query("select u from UserEntity u where u.fullName like %?1% or u.email like %?1%")
//    Page<UserEntity> findAll(String key, Pageable pageable);

    UserEntity findFirstByEmail(String email);

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "SELECT u FROM UserEntity u ORDER BY u.updated_at DESC")       // it will delete all the record with specific name
    List<UserEntity> findAllByUpdate_at();

    @Query(value = "SELECT count(u.id) FROM UserEntity u WHERE u.state = 1 ")
    int countAll();

    @Transactional //try to add this annotation
    @Modifying      // to mark delete or update query
    @Query(value = "UPDATE UserEntity u SET u.state = 1, u.updated_at = current_timestamp WHERE u.email = :email")       // it will delete all the record with specific name
    int active(@Param("email") String email);
}
