package com.example.ekka.repository.user;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.ekka.entities.UserTokenEntity;

public interface UserTokenRepository extends JpaRepository<UserTokenEntity, Long> {

    UserTokenEntity findFirstByEmailAndType(String email, Integer type);
}
