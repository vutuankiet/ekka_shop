package com.example.ekka.dto;

import com.google.api.client.util.DateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class UserDto {
    Long id;
    @NotEmpty(message = "Email field cannot be left blank")
    @Email(message = "Email Format")
    String email;
    String fullName;
    String phone;
    String address;
    String role;
    Timestamp created_at;
    Timestamp updated_at;
    @NotEmpty(message = "The password field cannot be left blank")
    String password;
    @NotEmpty(message = "Please do not leave the Re-enter password field blank")
    String rePassword;

    String avatar;
    MultipartFile fileImage;

    String background_profile;
    MultipartFile fileImageBackground;
    int state;
}
