package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductReportInfoRepository extends CrudRepository<ProductReportInfo, Integer> {
    String QUERY_LUONG_BAN = "SELECT * FROM CHITIETBAOCAOHANGTON CTBC WHERE CTBC.MaMH = :maMH AND CTBC.MaBCHT = :maBCHT";
    @Query(value = QUERY_LUONG_BAN, nativeQuery = true)
    Optional<ProductReportInfo> findAllByProductID(@Param("maMH") int maMH, @Param("maBCHT") int maBCHT);

    String QUERY_BY_ID = "SELECT * FROM CHITIETBAOCAOHANGTON CTBC where CTBC.MaBCHT = :maBCHT";
    @Query(value = QUERY_BY_ID, nativeQuery = true)
    Iterable<ProductReportInfo> findByProductReportID(@Param("maBCHT") int maBCHT);
}
