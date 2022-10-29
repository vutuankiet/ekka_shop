package com.example.ekka.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WishListDto {
    long id;
    int productId;
    int userId;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
    int count;
}
