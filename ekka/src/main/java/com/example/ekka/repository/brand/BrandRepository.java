package com.example.ekka.repository.brand;

import com.example.ekka.entities.BrandEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BrandRepository extends JpaRepository<BrandEntity, Long> {
    BrandEntity findFirstByNameBrand(String nameBrand);
    BrandEntity findAllById(long id);
}
