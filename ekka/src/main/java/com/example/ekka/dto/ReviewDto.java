package com.example.ekka.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReviewDto {
    long id;
    int productId;
    int userId;
    String comment;
    int rating;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
}
