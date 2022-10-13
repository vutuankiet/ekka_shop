package com.example.ekka.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.ProviderNotFoundException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.repository.user.UserRepository;

@Service
public class UserDetailServiceImpl implements UserDetailsService {
    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findFirstByEmail(email);
        if (userEntity == null)
            throw new ProviderNotFoundException("error.authen.account.notfound");
        return userEntity;
    }
}
