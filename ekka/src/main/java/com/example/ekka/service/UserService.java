package com.example.ekka.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.ekka.dao.UserDAO;
import com.example.ekka.dto.ChangePasswordDto;
import com.example.ekka.dto.ResponseDataTableDto;
import com.example.ekka.dto.ResponseDto;
import com.example.ekka.dto.UserDto;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.entities.UserTokenEntity;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.repository.user.UserTokenRepository;
import com.example.ekka.service.email.EmailDetails;
import com.example.ekka.service.email.EmailService;
import com.example.ekka.utils.Constant;
import com.example.ekka.utils.UserTypeEnum;

import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Service
public class UserService {

    @Autowired
    UserDAO userDAO;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserTokenRepository userTokenRepository;

    @Autowired
    EmailService emailService;

    public void save(UserDto userDto) throws Exception {
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userDto, userEntity);
//        SimpleDateFormat date = new SimpleDateFormat("dd.MM.yyyy.HH:mm:ss");
//        String timeStamp = date.format(new Date());
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        System.out.println("email" + email);
        if(email == null){
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            userEntity.setState(1);
            userEntity.setRole("USER");
            userEntity.setCreated_at(timestamp);
            userEntity.setPassword(passwordEncoder.encode(userDto.getPassword()));
//        userDAO.save(userDto);

            userRepository.save(userEntity);
        }else {
            throw new Exception("Email da ton tai!");
        }

    }

    public ResponseDto changePassword(ChangePasswordDto userDto) {
        // chuyển từ dto sang entity
        UserEntity userEntity = userRepository.findById(((UserEntity) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal()).getId()).get();
        if (!passwordEncoder.matches(userDto.getOldPassword(), userEntity.getPassword())) {
            return new ResponseDto(Constant.CODE_ERROR, "Mật khẩu không khớp");
        }
        userEntity.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(userEntity);
        return new ResponseDto(Constant.CODE_SUCCESS, "Đổi mật khẩu thành công");
    }

    public void list(ResponseDataTableDto dataTableDto) throws Exception {
        dataTableDto.list(userRepository);
    }

    public List<UserEntity> listAll() {
        return (List<UserEntity>) userRepository.findAll();
    }

    public ResponseDto forgotPassword(String email) {
        UserEntity userEntity = userRepository.findFirstByEmail(email);
        if (userEntity == null) {
            return new ResponseDto(Constant.CODE_ERROR, "Tài khoản không tồn tại");
        }

        String token = UUID.randomUUID().toString();

        UserTokenEntity userTokenEntity =  userTokenRepository.findFirstByEmailAndType(email, UserTypeEnum.FORGET_PASSWORD.ordinal());
        if (userTokenEntity == null) userTokenEntity = new UserTokenEntity();
        userTokenEntity.setEmail(email);
        userTokenEntity.setUserId(userEntity.getId());
        userTokenEntity.setToken(token);
        userTokenEntity.setType(UserTypeEnum.FORGET_PASSWORD.ordinal());
        userTokenEntity.setCreatedTime(new Timestamp(System.currentTimeMillis()));
        userTokenRepository.save(userTokenEntity);

        EmailDetails emailDetails = new EmailDetails();
        emailDetails.setRecipient(email);
        emailDetails.setSubject("[Bảo mật]XÁC NHẬN THAY ĐỔI MẬT KHẨU");
        emailDetails.setMsgBody(String.format("Token sử dụng để xác nhận mật khẩu là: %s\n" +
                "Vào đường link http://localhost:8080/ekka/user-verify để xác nhận mật khẩu\n Token có hiệu lực 5 phút", token));
        emailService.sendSimpleMail(emailDetails);
        return new ResponseDto(Constant.CODE_SUCCESS, "Gưi xác nhận thành công");
    }

    public ResponseDto verifyForgotPassword(ChangePasswordDto changePasswordDto) {
        UserTokenEntity userTokenEntity = userTokenRepository.findFirstByEmailAndType(changePasswordDto.getEmail(), UserTypeEnum.FORGET_PASSWORD.ordinal());
        if (userTokenEntity == null) {
            return new ResponseDto(Constant.CODE_ERROR, "Tài khoản không tồn tại");
        }

        if (!userTokenEntity.getToken().equalsIgnoreCase(changePasswordDto.getToken().trim()))
            return new ResponseDto(Constant.CODE_ERROR, "Token không đúng");

        if (System.currentTimeMillis() - 300_000L > userTokenEntity.getCreatedTime().getTime()) {
            return new ResponseDto(Constant.CODE_ERROR, "Thời gian hết hiệu lực");
        }

        UserEntity entity = userRepository.findFirstByEmail(changePasswordDto.getEmail());
        entity.setPassword(passwordEncoder.encode(changePasswordDto.getPassword()));
        userTokenRepository.deleteById(userTokenEntity.getId());
        return new ResponseDto(Constant.CODE_SUCCESS, "Đổi mật khẩu thành công");
    }

    public UserEntity get(long id) {
        return userRepository.findById(id).get();
    }

    public void update(UserDto userDto) throws Exception {
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userDto, userEntity);
//        SimpleDateFormat date = new SimpleDateFormat("dd.MM.yyyy.HH:mm:ss");
//        String timeStamp = date.format(new Date());
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        // Lấy ID của tài khoản  đa đăng nhập
        String email_profile = ((UserEntity)SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal()).getEmail();
        System.out.println("email" + email);
        if(email == null || Objects.equals(email.getEmail(), email_profile)){
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            userEntity.setId(email.getId());
            userEntity.setCreated_at(email.getCreated_at());
            userEntity.setUpdated_at(timestamp);
            userEntity.setRole(email.getRole());
            userEntity.setPassword(email.getPassword());
            userEntity.setState(email.getState());
//        userDAO.save(userDto);

            userRepository.save(userEntity);
        }else {
            throw new Exception("Khong duoc sua Email!");
        }

    }

    public void editUser(UserDto userDto) throws Exception {
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userDto, userEntity);
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("email" + email);
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            userEntity.setId(email.getId());
            userEntity.setCreated_at(email.getCreated_at());
            userEntity.setUpdated_at(timestamp);
            userEntity.setRole(email.getRole());
            userEntity.setPassword(email.getPassword());
            userEntity.setState(email.getState());
//        userDAO.save(userDto);

            userRepository.save(userEntity);

    }

    public void deleteUser(UserDto userDto) throws Exception {
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userDto, userEntity);
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("email" + email);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        userEntity.setId(email.getId());
        userEntity.setFullName(email.getFullName());
        userEntity.setPhone(email.getPhone());
        userEntity.setAddress(email.getAddress());
        userEntity.setCreated_at(email.getCreated_at());
        userEntity.setUpdated_at(timestamp);
        userEntity.setRole(email.getRole());
        userEntity.setPassword(email.getPassword());
//        userDAO.save(userDto);

        userRepository.save(userEntity);

    }

    public void restoreUser(UserDto userDto) throws Exception {
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userDto, userEntity);
        UserEntity email = userRepository.findFirstByEmail(userDto.getEmail());
        // Lấy ID của tài khoản  đa đăng nhập
        System.out.println("email" + email);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        userEntity.setId(email.getId());
        userEntity.setFullName(email.getFullName());
        userEntity.setPhone(email.getPhone());
        userEntity.setAddress(email.getAddress());
        userEntity.setCreated_at(email.getCreated_at());
        userEntity.setUpdated_at(timestamp);
        userEntity.setRole(email.getRole());
        userEntity.setPassword(email.getPassword());
//        userDAO.save(userDto);

        userRepository.save(userEntity);

    }

}

