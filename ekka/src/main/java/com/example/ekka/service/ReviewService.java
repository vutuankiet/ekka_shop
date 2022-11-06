package com.example.ekka.service;

import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.entities.BrandEntity;
import com.example.ekka.entities.OrderEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ReviewEntity;
import com.example.ekka.repository.Review.ReviewRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.service.email.EmailDetails;
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

    @Autowired
    ProductService productService;

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
        if(reviewDto.getComment().contains("fuck")){
            String reComment =  reviewDto.getComment().replace("fuck", "f*ck");
            reviewDto.setComment(reComment);
        }

        ReviewEntity reviewEntity = new ReviewEntity();
        BeanUtils.copyProperties(reviewDto, reviewEntity);

        ProductEntity product = productService.get(reviewDto.getProductId());
        try{
            double product_rating = product.getRating();
            if(product_rating == 0){
                double abs_rating = (product_rating  + reviewDto.getRating());
                double rating = (double) Math.round(abs_rating*10)/10;
                Float ratingStr = Float.valueOf(String.valueOf(rating));

                productRepository.updateRating(ratingStr,reviewDto.getProductId());
            }else {
                double abs_rating = ((product_rating  + reviewDto.getRating())/2);
                double rating = (double) Math.round(abs_rating*10)/10;
                Float ratingStr = Float.valueOf(String.valueOf(rating));

                productRepository.updateRating(ratingStr,reviewDto.getProductId());
            }

        }catch (Exception ex){
            throw ex;
        }
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        reviewEntity.setCreated_at(timestamp);
        reviewEntity.setUpdated_at(timestamp);
        reviewEntity.setProduct(productRepository.findById((long) reviewDto.getProductId()).orElse(null));
        reviewEntity.setUser(userRepository.findById((long) reviewDto.getUserId()).orElse(null));

        reviewRepository.save(reviewEntity);
    }

    public void deleteReview(ReviewDto reviewDto) throws Exception{
        try {
            reviewRepository.deleteById(reviewDto.getId());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void restoreReview(ReviewDto reviewDto) throws Exception{
        try {
            reviewRepository.restoreById(reviewDto.getId());
        }catch (Exception ex){
            throw  ex;
        }
    }

}
