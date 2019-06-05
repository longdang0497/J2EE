package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface ProductReportRepository extends CrudRepository<ProductReport, Integer> {
    String QUERY_FOR_REPORT = "SELECT BCHT.MaBCHT, BCHT.NgayLap, BCHT.Thang, SUM(CTBC.LuongNhapBĐ) AS TongNhap, SUM(CTBC.LuongTon) AS TongTon, SUM(CTBC.LuongBan) AS TongBan, BCHT.MaNV FROM BAOCAOHANGTON BCHT JOIN CHITIETBAOCAOHANGTON CTBC ON CTBC.MaBCHT = BCHT.MaBCHT WHERE BCHT.Thang = :thang";
    @Query(value = QUERY_FOR_REPORT, nativeQuery = true)
    Optional<ProductReport> createReport(@Param("thang") int thang);
}
