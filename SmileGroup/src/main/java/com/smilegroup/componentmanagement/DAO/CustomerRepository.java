package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.Customer;
import com.smilegroup.componentmanagement.Models.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM KHACHHANG kh where kh.TenKH = :tenKH";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<Customer> findByName(@Param("tenKH") String tenKH);
} //param truyền vào CrudRepository là model và kiểu dữ liệu của id
