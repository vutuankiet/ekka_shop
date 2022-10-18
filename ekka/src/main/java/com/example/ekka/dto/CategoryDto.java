package com.example.ekka.dto;

import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.GenderCategoryEntity;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class CategoryDto {
    long id;
    @NotEmpty(message = "Không được để trống trường name")
    String categoryName;
    @NotEmpty(message = "Không được để trống trường gender category")
    long genderCategoryId;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
    @NotEmpty(message = "Không được để trống trường logo")
    String categoryLogo;
    MultipartFile fileCategory;

    GenderCategoryDto genderCategoryDtoList;
    List<CategoryDto> category;
}
