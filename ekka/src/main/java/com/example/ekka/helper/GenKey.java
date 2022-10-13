package com.example.ekka.helper;

import java.util.Random;

public class GenKey {
    private final int length;

    public GenKey(int length) {
        this.length = length;
    }

    private int getRandomNumberInRange(int max) {
        Random random = new Random();

        double num = random.nextDouble();
        return (int) (num * (max));
    }

    public String gen() {
        try {
            String gen_string = "";
            char[] chars = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'i', 'u', 'y', 't', 'r', 'e', 'w', 'q', 'z', 'x', 'v', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'M', 'N', 'O', 'U', 'Y', 'T', 'R', 'W', 'Q', 'P', 'Z', 'X', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
            StringBuilder stringBuilder = new StringBuilder(gen_string);
            for (int start = 0; start <= this.length; start++) {
                int index = this.getRandomNumberInRange(chars.length);
                stringBuilder.append(chars[index]);
            }
            return stringBuilder.toString();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "";
        }
    }
}
