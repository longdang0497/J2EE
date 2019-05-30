package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface EmployeeRepository extends CrudRepository<Employee, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM NHANVIEN NV where NV.TenNV = :tenNV";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<Employee> findByName(@Param("tenNV") String tenNV);
}
