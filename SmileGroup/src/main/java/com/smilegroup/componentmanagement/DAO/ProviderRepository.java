package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.Provider;
import com.smilegroup.componentmanagement.Models.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProviderRepository extends CrudRepository<Provider, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM NHACUNGCAP ncc where ncc.TenNCC = :tenNCC";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<Provider> findByName(@Param("tenNCC") String tenNCC);
} //param truyền vào CrudRepository là model và kiểu dữ liệu của id
