package com.example.ekka.service;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.ContactDto;
import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.ContactEntity;
import com.example.ekka.repository.contact.ContactRepository;
import com.example.ekka.repository.user.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;

@Service
public class ContactService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    ContactRepository contactRepository;

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
}
