package com.example.ekka.service;

import com.example.ekka.dto.CategoryDto;
import com.example.ekka.dto.WishListDto;
import com.example.ekka.entities.CategoryEntity;
import com.example.ekka.entities.OrderEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.WishListEntity;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.repository.wishList.WishListRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class WishListService {
    @Autowired
    WishListRepository wishListRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;

    public List<WishListEntity> listAllUserId(long id) {
        return (List<WishListEntity>) wishListRepository.findAllByUserId(id);
    }

    public List<WishListEntity> listAllProductId(long id) {
        return (List<WishListEntity>) wishListRepository.findAllByProductId(id);
    }

    public List<WishListEntity> listAllProductIdAndUserId(long id, long UserId) {
        return (List<WishListEntity>) wishListRepository.findAllByProductIdAndUserId(id, UserId);
    }

    public int countWishList() {
        return wishListRepository.countAll();
    }

    public int countWishListUser(long id) {
        return wishListRepository.countAllByUser(id);
    }

    public void createWishList(WishListDto wishListDto) throws Exception {
        WishListEntity wishListEntity = new WishListEntity();
        BeanUtils.copyProperties(wishListDto, wishListEntity);

        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        wishListEntity.setCreated_at(timestamp);
        wishListEntity.setUpdated_at(timestamp);
        wishListEntity.setProduct(productRepository.findById((long) wishListDto.getProductId()).orElse(null));
        wishListEntity.setUser(userRepository.findById((long) wishListDto.getUserId()).orElse(null));

        wishListRepository.save(wishListEntity);

    }

    public void deleteWishList(WishListDto wishListDto) throws Exception {
        WishListEntity wishListEntity = new WishListEntity();
        BeanUtils.copyProperties(wishListDto, wishListEntity);

        wishListRepository.deleteById(wishListDto.getId());

    }

}
