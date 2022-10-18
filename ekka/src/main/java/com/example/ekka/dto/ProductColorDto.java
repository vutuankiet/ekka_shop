package com.example.ekka.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
public class ProductColorDto {
    long id;
    String colorName;
    List<String> color;
    long productId;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
}
