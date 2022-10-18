package com.example.ekka.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "brand", schema = "ekka", catalog = "")
@Data
public class BrandEntity {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(name = "LOGO")
    private String logo;

    @Basic
    @Column(name = "NAME_BRAND")
    private String nameBrand;

    @Basic
    @Column(name = "CREATED_AT")
    private Timestamp created_at;

    @Basic
    @Column(name = "UPDATED_AT")
    private Timestamp updated_at;

    @Basic
    @Column(name = "STATE")
    private int state;

    @OneToMany(mappedBy = "brand", cascade = CascadeType.ALL) // Quan hệ 1-n với đối tượng ở dưới (Person) (1 địa điểm có nhiều người ở)
    // MapopedBy trỏ tới tên biến brand ở trong ProductEntity.
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Khoonhg sử dụng trong toString()
    private Collection<ProductEntity> productEntityCollection;
}
