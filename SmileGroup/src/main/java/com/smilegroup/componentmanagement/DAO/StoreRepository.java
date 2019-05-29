package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StoreRepository extends CrudRepository<Store, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM KHO k where k.TenKhu = :tenKhu";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<Store> findByName(@Param("tenKhu") String tenKhu);
}
//param truyền vào CrudRepository là model và kiểu dữ liệu của id
