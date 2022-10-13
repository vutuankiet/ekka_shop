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
    @NotEmpty(message = "Không được để trống trường email")
    @Email(message = "Định dạng email")
    String email;
    String fullName;
    String phone;
    String address;
    String role;
    Timestamp created_at;
    Timestamp updated_at;
    @NotEmpty(message = "Không được để trống trường mật khẩu")
    String password;
    @NotEmpty(message = "Không được để trống trường Nhập lại mạt khẩu")
    String rePassword;

    String avatar;
    MultipartFile fileImage;

    String background_profile;
    MultipartFile fileImageBackground;
    int state;
}
