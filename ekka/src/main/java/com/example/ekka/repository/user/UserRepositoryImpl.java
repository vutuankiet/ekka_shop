package com.example.ekka.repository.user;

import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import com.example.ekka.dto.UserDto;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

public class UserRepositoryImpl implements UserRepositoryCustom {
    @PersistenceContext
    EntityManager em;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<UserDto> findAllCusstom() {
        return em.unwrap(Session.class)
                .createNativeQuery("SELECT u.EMAIL email, u.FULL_NAME fullName FROM USER u")
                .addScalar("email", StringType.INSTANCE)
                .addScalar("fullName", StringType.INSTANCE)
                .setResultTransformer(Transformers.aliasToBean(UserDto.class)).list();


    }
}
