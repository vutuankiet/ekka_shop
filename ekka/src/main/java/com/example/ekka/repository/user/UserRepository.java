package com.example.ekka.repository.user;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.repository.SearchingRepository;

import java.util.List;

// so sánh jpa, spring data jpa và herbinate
public interface UserRepository extends SearchingRepository<UserEntity, Long>, UserRepositoryCustom {
    List<UserEntity> findAllByEmail(String email);
    @Query(value = "select u from UserEntity u where u.email =:email")
    List<UserEntity> findAllByEmail2(String email);
    @Query(value = "SELECT * FROM USER where EMAIL = ?1", nativeQuery = true)
    List<UserEntity> findAllByEmail3(String email);

    @Query("select u from UserEntity u where u.fullName like %?1% or u.email like %?1%")
    Page<UserEntity> findAll(String key, Pageable pageable);

    UserEntity findFirstByEmail(String email);
}
