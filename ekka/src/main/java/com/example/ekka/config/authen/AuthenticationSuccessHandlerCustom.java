package com.example.ekka.config.authen;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import com.example.ekka.entities.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Component
public class AuthenticationSuccessHandlerCustom implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
//        SecurityContextHolder.getContext().getAuthentication();
        UserEntity userEntity = ((UserEntity)authentication.getPrincipal());
        if ("ADMIN".equalsIgnoreCase(userEntity.getRole())) {
            response.sendRedirect("/ekka/admin");
        } else {
            response.sendRedirect("/ekka/home");
        }
    }
}
