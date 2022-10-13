package com.example.ekka.dao;

import java.util.List;

public interface PagingDAO {
    List<?> list(Integer page, Integer perpage) throws Exception;

    Integer count() throws Exception;
}
