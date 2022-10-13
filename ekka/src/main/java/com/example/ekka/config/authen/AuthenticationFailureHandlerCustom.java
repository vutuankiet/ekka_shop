package com.example.ekka.config.authen;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class AuthenticationFailureHandlerCustom implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        System.out.println(exception.getLocalizedMessage());
        String errorCode = "error.authen.default";
        if (exception instanceof BadCredentialsException) {
            errorCode = "error.authen.wrong.password";
        } else if (exception instanceof DisabledException) {
            errorCode = "error.authen.account.disabled";
        } else {
            errorCode = exception.getMessage();
        }
//        response.addHeader("error", errorCode);
        response.sendRedirect("/ekka/login?error=" + errorCode);
    }
}
