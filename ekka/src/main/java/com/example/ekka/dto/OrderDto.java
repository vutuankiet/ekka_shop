package com.example.ekka.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {
    long id;
    int productId;
    int userId;

//  dung cho changeState3
    long idUser;
//  dung cho changeState3

    String email;
    String order_code;
    String color_product;
    String size_product;
    String delivery_address;
    String name_consignee;
    String delivery_phone;
    int item;
    String price;
    int payment;
    double total_price;
    Timestamp created_at;
    Timestamp updated_at;
    int state;


    List<String> product;
    List<String> color;
    List<String> size;
    List<String> itemProduct;
    List<String> totalPrice;
    List<String> cart;
}
