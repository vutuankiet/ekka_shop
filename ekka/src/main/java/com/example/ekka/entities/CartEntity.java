package com.example.ekka.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "cart", schema = "ekka", catalog = "")
@Data
public class CartEntity {
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
    @Column(name = "COLOR_PRODUCT")
    private String color_product;

    @Basic
    @Column(name = "SIZE_PRODUCT")
    private String size_product;

    @Basic
    @Column(name = "ITEM")
    private int item;

    @Basic
    @Column(name = "PRICE")
    private String price;

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
