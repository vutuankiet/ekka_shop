package com.example.ekka.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class ProductDto {
    long id;
    String productName;
    String productImage;
    String details;
    String moreInformation;
    long categoryId;
    long brandId;
    String totalProduct;
    String priceProduct;
    String discount;
    Float rating;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
    List<String> image;
    List<MultipartFile> fileImage;
    @NotNull(message = "khong duoc de trong1")
    @NotEmpty(message = "Khong duoc de trong2")
    @NotBlank(message = "khong duoc de trong3")
    @Size(message = "khong duoc de trong4")
    List<String> color;

    String colorEdit1;
    String colorEdit2;
    String colorEdit3;
    String colorEdit4;

    String imageEdit1;
    String imageEdit2;
    String imageEdit3;
    String imageEdit4;
    String imageEdit5;
    String imageEdit6;
    String imageEdit7;

    MultipartFile fileImageEdit1;
    MultipartFile fileImageEdit2;
    MultipartFile fileImageEdit3;
    MultipartFile fileImageEdit4;
    MultipartFile fileImageEdit5;
    MultipartFile fileImageEdit6;
    MultipartFile fileImageEdit7;
    @NotNull(message = "khong duoc de trong1")
    @NotEmpty(message = "Khong duoc de trong2")
    @NotBlank(message = "khong duoc de trong3")
    @Size(message = "khong duoc de trong4")
    List<String> size;

    String size1;
    String size2;
    String size3;
    String size4;
    String size5;

    CategoryDto categoryDtoList;

}
