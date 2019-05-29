package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UnitRepository extends CrudRepository<Unit, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM DONVITINH dvt where dvt.TenDV = :tenDV";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<Unit> findByName(@Param("tenDV") String tenDV);
}
//param truyền vào CrudRepository là model và kiểu dữ liệu của id
