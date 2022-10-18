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
    String details;
    String moreInformation;
    long categoryId;
    long brandId;
    String totalProduct;
    String priceProduct;
    String discount;
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
    @NotNull(message = "khong duoc de trong1")
    @NotEmpty(message = "Khong duoc de trong2")
    @NotBlank(message = "khong duoc de trong3")
    @Size(message = "khong duoc de trong4")
    List<String> size;

    CategoryDto categoryDtoList;

}
