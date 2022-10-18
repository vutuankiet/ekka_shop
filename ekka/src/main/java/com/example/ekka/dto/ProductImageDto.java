package com.example.ekka.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class ProductImageDto {
    long id;
    long productId;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
    String imageProduct;
    List<String> image;
    List<MultipartFile> fileImage;
}
