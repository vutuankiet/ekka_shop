package com.example.ekka.entities;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "user_token", schema = "k34_dl", catalog = "")
public class UserTokenEntity {
    private Long id;
    private long userId;
    private String email;
    private String token;
    private Integer type;
    private Timestamp createdTime;

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "USER_ID")
    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "EMAIL")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "TOKEN")
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Basic
    @Column(name = "TYPE")
    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }


    @Basic
    @Column(name = "CREATED_TIME")
    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }
}
