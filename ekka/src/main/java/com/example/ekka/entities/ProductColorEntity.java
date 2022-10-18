package com.example.ekka.entities;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "product_color", schema = "ekka", catalog = "")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductColorEntity {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(name = "COLOR_NAME")
    private String colorName;

    @ManyToOne
    @JoinColumn(name = "PRODUCT_ID") // thông qua khóa ngoại product_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private ProductEntity product;

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
