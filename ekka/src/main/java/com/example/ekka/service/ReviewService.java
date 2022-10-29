package com.example.ekka.service;

import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.entities.OrderEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ReviewEntity;
import com.example.ekka.repository.Review.ReviewRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.user.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class ReviewService {
    @Autowired
    ReviewRepository reviewRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;

    public List<ReviewEntity> listAll() {
        return (List<ReviewEntity>) reviewRepository.findAll();
    }
    public List<ReviewEntity> listAllCreateDesc() {
        return (List<ReviewEntity>) reviewRepository.findAllByUpdated_at();
    }

    public List<ReviewEntity> listAllProductId(long id) {
        return (List<ReviewEntity>) reviewRepository.findAllByProductId(id);
    }

    public List<ReviewEntity> listAllProductIdAndUserId(long id, long userId) {
        return (List<ReviewEntity>) reviewRepository.findAllByProductIdAndUserId(id, userId);
    }

    public int countAll(long id) {
        return reviewRepository.countAll(id);
    }

    public void save(ReviewDto reviewDto) throws Exception {
        ReviewEntity reviewEntity = new ReviewEntity();
        BeanUtils.copyProperties(reviewDto, reviewEntity);

        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        reviewEntity.setCreated_at(timestamp);
        reviewEntity.setUpdated_at(timestamp);
        reviewEntity.setProduct(productRepository.findById((long) reviewDto.getProductId()).orElse(null));
        reviewEntity.setUser(userRepository.findById((long) reviewDto.getUserId()).orElse(null));

        reviewRepository.save(reviewEntity);
    }

}
