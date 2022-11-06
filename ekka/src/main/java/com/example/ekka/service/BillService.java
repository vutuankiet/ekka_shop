package com.example.ekka.service;

import com.example.ekka.entities.BillEntity;
import com.example.ekka.repository.bill.BillRepository;
import com.example.ekka.repository.cart.CartRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.service.email.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillService {
    @Autowired
    ProductService productService;

    @Autowired
    EmailService emailService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    CartRepository cartRepository;
    
    @Autowired
    BillRepository billRepository;

    public List<BillEntity> findByUser(String code) {
        return (List<BillEntity>) billRepository.findAllByOrder_code(code);
    }

    public List<BillEntity> findByUserId(long id) {
        return (List<BillEntity>) billRepository.findAllByUserId(id);
    }

    public List<BillEntity> listAllDelivered() {
        return (List<BillEntity>) billRepository.findAllByDelivered();
    }
    public int countAllDelivered() {
        return billRepository.countOrderDelivered();
    }
    public int countAll() {
        return billRepository.countAll();
    }

    public List<BillEntity> findAllByUpdateDesc() {
        return (List<BillEntity>) billRepository.findAllByUpdate_at();
    }
}
