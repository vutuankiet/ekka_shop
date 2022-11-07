package com.example.ekka.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "gender_category", schema = "ekka", catalog = "")
@Data
public class GenderCategoryEntity {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(name = "GENDER_CATEGORY_NAME")
    private String genderCategoryName;

    @Basic
    @Column(name = "GENDER_CATEGORY_LOGO")
    private String genderCategoryLogo;

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

//    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
//    List<CategoryEntity> categoryEntityList;

    @OneToMany(mappedBy = "genderCategory", cascade = CascadeType.ALL) // Quan hệ 1-n với đối tượng ở dưới (Person) (1 địa điểm có nhiều người ở)
    // MapopedBy trỏ tới tên biến Address ở trong Person.
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Khoonhg sử dụng trong toString()
    private Collection<CategoryEntity> categoryEntityCollection;
}
