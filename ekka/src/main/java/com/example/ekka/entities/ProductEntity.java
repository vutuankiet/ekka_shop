package com.example.ekka.entities;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "product", schema = "ekka", catalog = "")
@Data
public class ProductEntity {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Basic
    @Column(name = "PRODUCT_NAME")
    private String productName;

    @Basic
    @Column(name = "DETAILS")
    private String details;

    @Basic
    @Column(name = "MORE_INFORMATION")
    private String moreInformation;

    @Basic
    @Column(name = "TOTAL_PRODUCT")
    private String totalProduct;

    @Basic
    @Column(name = "PRICE_PRODUCT")
    private String priceProduct;

    @Basic
    @Column(name = "DISCOUNT")
    private String discount;

    @ManyToOne
    @JoinColumn(name = "CATEGORY_ID") // thông qua khóa ngoại category_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private CategoryEntity category;

    @ManyToOne
    @JoinColumn(name = "BRAND_ID") // thông qua khóa ngoại brand_id
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private BrandEntity brand;

    @Basic
    @Column(name = "CREATED_AT")
    private Timestamp created_at;

    @Basic
    @Column(name = "UPDATED_AT")
    private Timestamp updated_at;

    @Basic
    @Column(name = "STATE")
    private int state;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL) // Quan hệ 1-n với đối tượng ở dưới (Person) (1 địa điểm có nhiều người ở)
    // MapopedBy trỏ tới tên biến product ở trong ProductImageEntity.
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Khoonhg sử dụng trong toString()
    private Collection<ProductImageEntity> productImageEntityCollection;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL) // Quan hệ 1-n với đối tượng ở dưới (Person) (1 địa điểm có nhiều người ở)
    // MapopedBy trỏ tới tên biến product ở trong ProductColorEntity.
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Khoonhg sử dụng trong toString()
    private Collection<ProductColorEntity> productColorEntityCollection;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL) // Quan hệ 1-n với đối tượng ở dưới (Person) (1 địa điểm có nhiều người ở)
    // MapopedBy trỏ tới tên biến product ở trong ProductSizeEntity.
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Khoonhg sử dụng trong toString()
    private Collection<ProductSizeEntity> productSizeEntityCollection;
}
