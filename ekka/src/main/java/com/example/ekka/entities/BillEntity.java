package com.example.ekka.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "bill", schema = "ekka", catalog = "")
@Data
public class BillEntity {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "USER_ID") // thông qua khóa ngoại product_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private UserEntity user;

    @Basic
    @Column(name = "ORDER_CODE")
    private String order_code;

    @Basic
    @Column(name = "DELIVERY_ADDRESS")
    private String delivery_address;

    @Basic
    @Column(name = "NAME_CONSIGNEE")
    private String name_consignee;

    @Basic
    @Column(name = "DELIVERY_PHONE")
    private String delivery_phone;

    @Basic
    @Column(name = "PRICE")
    private String price;

    @Basic
    @Column(name = "PAYMENT")
    private int payment;

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
