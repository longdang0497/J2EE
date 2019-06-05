package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface ProductReportInfoRepository extends CrudRepository<ProductReportInfo, Integer> {
    String QUERY_FOR_REPORT_INFO = "SELECT MH.MaMH, MH.TenMH, MONTH(HD.NgayLap) AS Thang, SUM(CTPN.SoLuong) AS LuongNhapBĐ, SUM(CTHD.SoLuong) AS LuongBan, SUM(MH.SoLuong) AS LuongTon FROM CHITIETPHIEUNHAP CTPN, PHIEUNHAPHANG PN, HOADON HD, CHITIETHOADON CTHD, MATHANG MH WHERE CTPN.MaPN = PN.MaPN AND CTHD.MaHD = HD.MaHD AND CTHD.MaMH = MH.MaMH AND MONTH(PN.NgayLapPhieu) = :thang AND MONTH(HD.NgayLap) = :thang GROUP BY MH.TenMH";
    @Query(value = QUERY_FOR_REPORT_INFO, nativeQuery = true)
    Iterable<ProductReportInfoDTO> calculateImportExportLeft(@Param("thang") int thang);
}
