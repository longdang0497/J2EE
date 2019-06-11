package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Optional;

public interface BillInfoRepository extends CrudRepository<BillInfo, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM CHITIETHOADON CTHD where CTHD.MaHD = :maHD";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Iterable<BillInfo> findByBillID(@Param("maHD") int maHD);

    String QUERY_BY_PRODUCT = "SELECT SUM(CTHD.SoLuong) AS SoLuong FROM CHITIETHOADON CTHD where CTHD.MaMH = :maMH AND CTHD.MaHD = :maHD";
    @Query(value = QUERY_BY_PRODUCT, nativeQuery = true)
    Long calculateSumSellByProductID(@Param("maHD") int maHD, @Param("maMH") int maMH);

    String QUERY_FOR_SUM = "SELECT SUM(CTHD.TienThanhToan) FROM CHITIETHOADON CTHD where CTHD.MaHD = :maHD";
    @Query(value = QUERY_FOR_SUM, nativeQuery = true)
    Long calculateSumSell(@Param("maHD") int maHD);
}
