package com.example.ekka.paging;

import java.lang.annotation.*;

@Target({ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface PagingParam {
    String path() default "";
}
