package com.example.ekka.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class ProductSizeDto {
    long id;
    String sizeName;
    List<String> size;
    long productId;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
}
