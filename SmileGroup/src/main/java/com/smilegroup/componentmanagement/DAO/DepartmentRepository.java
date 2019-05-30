package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DepartmentRepository extends CrudRepository<Department, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM PHONGBAN pb where pb.TenPhong = :tenPhong";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<Department> findByName(@Param("tenPhong") String tenPhong);
}
//param truyền vào CrudRepository là model và kiểu dữ liệu của id
