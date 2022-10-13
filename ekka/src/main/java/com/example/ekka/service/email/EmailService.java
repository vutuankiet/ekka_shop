package com.example.ekka.service.email;
public interface EmailService {

    // Method
    // To send a simple email
    void sendSimpleMail(EmailDetails details);

    // Method
    // To send an email with attachment
    String sendMailWithAttachment(EmailDetails details);
}