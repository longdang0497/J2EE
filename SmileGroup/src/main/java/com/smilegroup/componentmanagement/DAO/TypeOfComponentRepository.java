package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TypeOfComponentRepository extends CrudRepository<TypeOfComponent, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM LOAIMATHANG lmh where lmh.TenLoai = :tenLoai";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<TypeOfComponent> findByName(@Param("tenLoai") String tenLoai);
}
//param truyền vào CrudRepository là model và kiểu dữ liệu của id
