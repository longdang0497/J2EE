package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductReportInfoRepository extends CrudRepository<ProductReportInfo, Integer> {
    String QUERY_LUONG_BAN = "SELECT * FROM CHITIETBAOCAOHANGTON CTBC WHERE CTBC.MaMH = :maMH";
    @Query(value = QUERY_LUONG_BAN, nativeQuery = true)
    Optional<ProductReportInfo> findAllByProductID(@Param("maMH") int maMH);
}
