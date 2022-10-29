package com.example.ekka.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;
@Entity
@Table(name = "wish_list", schema = "ekka", catalog = "")
@Data
public class WishListEntity {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "PRODUCT_ID") // thông qua khóa ngoại product_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private ProductEntity product;

    @ManyToOne
    @JoinColumn(name = "USER_ID") // thông qua khóa ngoại product_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private UserEntity user;

    @Basic
    @Column(name = "CREATED_AT")
    private Timestamp created_at;

    @Basic
    @Column(name = "UPDATED_AT")
    private Timestamp updated_at;

    @Basic
    @Column(name = "STATE")
    private int state;
}
