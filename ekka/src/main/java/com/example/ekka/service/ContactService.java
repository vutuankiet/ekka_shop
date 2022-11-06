package com.example.ekka.service;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.ContactDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.ContactEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ReviewEntity;
import com.example.ekka.repository.contact.ContactRepository;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.service.email.EmailDetails;
import com.example.ekka.service.email.EmailService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class ContactService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    EmailService emailService;

    @Autowired
    ContactRepository contactRepository;

    public List<ContactEntity> listAllCreateDesc() {
        return (List<ContactEntity>) contactRepository.findAllByUpdated_at();
    }

    public ContactEntity get(long id) {
        return contactRepository.findById(id).get();
    }

    public void save(ContactDto contactDto) throws Exception {
        ContactEntity contactEntity = new ContactEntity();
        BeanUtils.copyProperties(contactDto, contactEntity);
            Long datetime = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(datetime);
            contactEntity.setCreated_at(timestamp);
            contactEntity.setUpdated_at(timestamp);
            contactEntity.setState(1);
            contactEntity.setUser(userRepository.findById(contactDto.getUserId()).orElse(null));

            contactRepository.save(contactEntity);
    }

    public void deleteContact(ContactDto contactDto) throws Exception{
        try {
            contactRepository.deleteById(contactDto.getId());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void restoreContact(ContactDto contactDto) throws Exception{
        try {
            contactRepository.restoreById(contactDto.getId());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void replyContact(ContactDto contactDto) throws Exception{
        if(contactDto.getEmail() == null) {
            throw new Exception();
        }
        try {
            EmailDetails emailDetails = new EmailDetails();
            emailDetails.setRecipient(contactDto.getEmail());
            emailDetails.setSubject("[THƯ PHẢN HỒI - EKKA SHOP] Trả lời comment/question của bạn "+contactDto.getFirst_name()+" "+contactDto.getLast_name());
            emailDetails.setMsgBody(String.format("Hi "+contactDto.getFirst_name()+" "+contactDto.getLast_name() +",\n" +
                    "Cảm ơn bạn đã gửi phản hồi đến ekka shop!\n" +
                    "Chúng tôi xin trả lời cho bình luận/câu hỏi của bạn: \n "+contactDto.getReply()+"\n" +
                    "Đội ngũ Ekka Shop."));
            emailService.sendSimpleMail(emailDetails);
            contactRepository.replyContactById(contactDto.getReply(),contactDto.getId());
        }catch (Exception ex){
            throw  ex;
        }
    }
}
