package com.example.ekka.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContactDto {
    long id;
    long userId;
    String first_name;
    String last_name;
    String email;
    String phone;
    String comment;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
}
