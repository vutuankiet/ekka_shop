package com.example.ekka.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BillDto {
    long id;
    int productId;
    int userId;

    //  dung cho changeState3
    long idUser;
//  dung cho changeState3

    String email;
    String order_code;
    String delivery_address;
    String name_consignee;
    String delivery_phone;
    String price;
    int payment;
    double total_price;
    Timestamp created_at;
    Timestamp updated_at;
    int state;
}
