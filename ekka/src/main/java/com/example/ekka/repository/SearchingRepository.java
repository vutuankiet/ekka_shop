package com.example.ekka.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface SearchingRepository<T, ID> extends JpaRepository<T, ID> {
    Page<T> findAllProduct(String key, String category, String genderCategory, float firstPrice, float lastPrice, Pageable pageable);
}
