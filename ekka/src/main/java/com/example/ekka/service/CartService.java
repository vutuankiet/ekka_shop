package com.example.ekka.service;

import com.example.ekka.dto.CartDto;
import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.WishListDto;
import com.example.ekka.entities.CartEntity;
import com.example.ekka.entities.WishListEntity;
import com.example.ekka.repository.cart.CartRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.user.UserRepository;
import com.example.ekka.repository.wishList.WishListRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class CartService {
    @Autowired
    CartRepository cartRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;

    public List<CartEntity> listAllUserId(long id) {
        return (List<CartEntity>) cartRepository.findAllByUserId(id);
    }

    public List<CartEntity> listAllProductId(long id) {
        return (List<CartEntity>) cartRepository.findAllByProductId(id);
    }

    public int countCart() {
        return cartRepository.countAll();
    }

    public void createCart(CartDto cartDto) throws Exception {
        CartEntity cartEntity = new CartEntity();
        BeanUtils.copyProperties(cartDto, cartEntity);

        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        cartEntity.setCreated_at(timestamp);
        cartEntity.setUpdated_at(timestamp);
        cartEntity.setProduct(productRepository.findById((long) cartDto.getProductId()).orElse(null));
        cartEntity.setUser(userRepository.findById((long) cartDto.getUserId()).orElse(null));

        cartRepository.save(cartEntity);

    }

    public void deleteCart(CartDto cartDto) throws Exception {
        CartEntity cartEntity = new CartEntity();
        BeanUtils.copyProperties(cartDto, cartEntity);

        cartRepository.deleteById(cartDto.getId());

    }
}
