package com.example.ekka.dao;

import org.springframework.stereotype.Component;
import com.example.ekka.dto.UserDto;
import com.example.ekka.utils.DbUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Component
public class UserDAO implements PagingDAO{
    public void save(UserDto userDto) throws Exception {
        Connection con = DbUtils.getCollection();
        Statement sqlFile = con.createStatement();
        try {
            // Bước 3: Tạo câu truy vấn
            String selectSql = String.format("INSERT INTO user (EMAIL, PASSWORD, FULLNAME,ADDRESS,ROLE,AVATAR) " +
                            "VALUES ('%s', '%s','%s', '%s', '%s', '%s') ",
                    userDto.getEmail(), userDto.getPassword(), userDto.getFullName(), userDto.getAddress(), userDto.getRole(), userDto.getAvatar());
            // Bước 4; Run kết quả
            sqlFile.execute(selectSql);
        } finally {
            // Bước 5: Đóng kết nối
            sqlFile.close();
            con.close();
        }
    }

    public List<UserDto> list(Integer page, Integer perpage) throws Exception {
        List<UserDto> sachDtoList = new ArrayList<>();
        Connection conn = DbUtils.getCollection();
        Statement sqlFile = conn.createStatement();
        try {
            String selectSql = "Select * from user LIMIT " + perpage + " OFFSET " + (page - 1) * perpage;
            ResultSet resultSet = sqlFile.executeQuery(selectSql);
            while (resultSet.next()) {
                UserDto userDto = new UserDto();
                userDto.setId((long) resultSet.getInt("ID"));
                userDto.setAvatar(resultSet.getString("AVATAR"));
                userDto.setAddress(resultSet.getString("ADDRESS"));
                userDto.setEmail(resultSet.getString("EMAIL"));
                userDto.setFullName(resultSet.getString("FULLNAME"));
                sachDtoList.add(userDto);
            }
            resultSet.close();
        } finally {
            sqlFile.close();
            conn.close();
        }
        return sachDtoList;
    }

    public Integer count() throws Exception {
        Integer count = 0;
        Connection conn = DbUtils.getCollection();
        Statement sqlFile = conn.createStatement();
        try {
            String selectSql = "Select count(*) from user ";
            ResultSet resultSet = sqlFile.executeQuery(selectSql);
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            resultSet.close();
        } finally {
            sqlFile.close();
            conn.close();
        }
        return count;
    }
}
