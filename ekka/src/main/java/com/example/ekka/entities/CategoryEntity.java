package com.example.ekka.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "category", schema = "ekka", catalog = "")
@Data
public class CategoryEntity {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(name = "CATEGORY_LOGO")
    private String categoryLogo;

    @Basic
    @Column(name = "CATEGORY_NAME")
    private String categoryName;

//    @Basic
//    @Column(name = "GENDER_CATEGORY_ID")
//    private long genderCategoryId;

//    @ManyToOne
//    @JoinColumn(name = "GENDER_CATEGORY_ID")
//    private GenderCategoryEntity genderCategory;

    @ManyToOne
    @JoinColumn(name = "GENDER_CATEGORY_ID") // thông qua khóa ngoại gender_category_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private GenderCategoryEntity genderCategory;

    @Basic
    @Column(name = "CREATED_AT")
    private Timestamp created_at;

    @Basic
    @Column(name = "UPDATED_AT")
    private Timestamp updated_at;

    @Basic
    @Column(name = "STATE")
    private int state;

    @Basic
    @Column(name = "ITEM")
    private int item;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL) // Quan hệ 1-n với đối tượng ở dưới (Person) (1 địa điểm có nhiều người ở)
    // MapopedBy trỏ tới tên biến category ở trong ProductEntity.
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Khoonhg sử dụng trong toString()
    private Collection<ProductEntity> productEntityCollection;
}
