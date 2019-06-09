package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductReportRepository extends CrudRepository<ProductReport, Integer> {
    String QUERY_SUM_IMPORT = "SELECT SUM(LuongNhapBĐ) FROM CHITIETBAOCAOHANGTON CTBC WHERE CTBC.MaBCHT = :maBCHT";
    @Query(value = QUERY_SUM_IMPORT, nativeQuery = true)
    Long sumImport(@Param("maBCHT") int maBCHT);

    String QUERY_SUM_SELL = "SELECT SUM(LuongBan) FROM CHITIETBAOCAOHANGTON CTBC WHERE CTBC.MaBCHT = :maBCHT";
    @Query(value = QUERY_SUM_SELL, nativeQuery = true)
    Long sumSell(@Param("maBCHT") int maBCHT);

    String QUERY_SUM_LEFT = "SELECT SUM(LuongTon) FROM CHITIETBAOCAOHANGTON CTBC WHERE CTBC.MaBCHT = :maBCHT";
    @Query(value = QUERY_SUM_LEFT, nativeQuery = true)
    Long sumLeft(@Param("maBCHT") int maBCHT);
}
