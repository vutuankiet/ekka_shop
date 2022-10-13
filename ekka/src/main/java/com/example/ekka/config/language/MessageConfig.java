package com.example.ekka.config.language;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

@Component
public class MessageConfig {

    @Autowired
    MessageSource messageSource;

    public String getMessage(String code) {
        return messageSource.getMessage(code, null, LocaleContextHolder.getLocale());
    }
}
