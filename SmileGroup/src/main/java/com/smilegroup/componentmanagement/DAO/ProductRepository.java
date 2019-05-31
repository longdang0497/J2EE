package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductRepository extends CrudRepository<Product, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM MATHANG mh where mh.TenMH = :tenMH";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<Product> findByName(@Param("tenMH") String tenMH);

    String QUERY_BY_PRICE = "SELECT DonGiaBan FROM MATHANG mh where mh.TenMH = :tenMH";
    @Query(value = QUERY_BY_PRICE, nativeQuery = true)
    Optional<Product> findPriceByName(@Param("tenMH") String tenMH);
}
