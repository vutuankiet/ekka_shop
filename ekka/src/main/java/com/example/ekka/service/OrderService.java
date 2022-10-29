package com.example.ekka.service;

import com.example.ekka.dto.OrderDto;
import com.example.ekka.dto.ProductDto;
import com.example.ekka.entities.*;
import com.example.ekka.helper.GenKey;
import com.example.ekka.repository.cart.CartRepository;
import com.example.ekka.repository.order.OrderRepository;
import com.example.ekka.repository.product.ProductRepository;
import com.example.ekka.repository.user.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    CartRepository cartRepository;

    public List<OrderEntity> listAll() {
        return (List<OrderEntity>) orderRepository.findAll();
    }

    public List<OrderEntity> listAllDelivered() {
        return (List<OrderEntity>) orderRepository.findAllByDelivered();
    }
    public int countAllDelivered() {
        return orderRepository.countOrderDelivered();
    }
    public int countAll() {
        return orderRepository.countAll();
    }

    public List<OrderEntity> findAllByUpdateDesc() {
        return (List<OrderEntity>) orderRepository.findAllByUpdate_at();
    }

    public void changeState0(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState0(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void changeState1(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState1(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void changeState2(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState2(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void changeState3(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState3(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public void changeState4(OrderDto orderDto) throws Exception{
        try {
            orderRepository.changeState4(orderDto.getOrder_code());
        }catch (Exception ex){
            throw  ex;
        }
    }

    public List<OrderEntity> get(String code) {
        return (List<OrderEntity>) orderRepository.findAllByOrder_code(code);
    }


    public void save(OrderDto orderDto) throws Exception {
        OrderEntity orderEntity = new OrderEntity();
        BeanUtils.copyProperties(orderDto, orderEntity);

        try {
            System.out.println(orderDto.getColor());
            for (int c = 0; c < orderDto.getCart().size(); c++){
            for (int i = 0; i < orderDto.getProduct().size(); i++){
                for (int j = 0; j < orderDto.getColor().size(); j++) {
                    for (int k = 0; k < orderDto.getSize().size(); k++) {
                        for (int h = 0; h < orderDto.getItemProduct().size(); h++) {
                            for (int g = 0; g < orderDto.getTotalPrice().size(); g++) {
                                if (c==i && i == j && j == k && k == h && h == g) {
                                    System.out.println("ok: " + i);
                                    Long datetime = System.currentTimeMillis();
                                    Timestamp timestamp = new Timestamp(datetime);
                                    orderEntity.setCreated_at(timestamp);
                                    orderEntity.setUpdated_at(timestamp);
                                    orderEntity.setColor_product(orderDto.getColor().get(j));
                                    orderEntity.setSize_product(orderDto.getSize().get(k));
                                    orderEntity.setItem(Integer.parseInt(orderDto.getItemProduct().get(h)));
                                    orderEntity.setPrice(orderDto.getTotalPrice().get(g));
                                    orderEntity.setOrder_code(orderDto.getOrder_code());
                                    orderEntity.setDelivery_address(orderDto.getDelivery_address());
                                    orderEntity.setName_consignee(orderDto.getName_consignee());
                                    orderEntity.setDelivery_phone(orderDto.getDelivery_phone());
                                    orderEntity.setPayment(0);
                                    orderEntity.setState(1);
                                    long productId = Long.parseLong(orderDto.getProduct().get(i));
                                    System.out.println("ProductId: " + productId);
                                    orderEntity.setProduct(productRepository.findById(productId).orElse(null));
                                    orderEntity.setUser(userRepository.findById((long) orderDto.getUserId()).orElse(null));

                                    orderRepository.save(orderEntity);
                                    cartRepository.deleteById(Long.parseLong(orderDto.getCart().get(c)));
                                }
                            }
                        }
                    }
                }
                }
            }

        }catch (Exception ex){
            throw ex;
        }
    }
}
