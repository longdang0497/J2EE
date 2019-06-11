package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Optional;

public interface ImportProductInfoRepository extends CrudRepository<ImportProductInfo, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM CHITIETPHIEUNHAP CTPN where CTPN.MaPN = :maPN";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Iterable<ImportProductInfo> findByImportProductID(@Param("maPN") int maPN);

    String QUERY_BY_PRODUCT = "SELECT SUM(CTPN.SoLuong) FROM CHITIETPHIEUNHAP CTPN where CTPN.MaMH = :maMH AND CTPN.MaPN = :maPN";
    @Query(value = QUERY_BY_PRODUCT, nativeQuery = true)
    Long calculateSumImportByProductID(@Param("maPN") int maPN, @Param("maMH") int maMH);

    String QUERY_FOR_SUM = "SELECT SUM(CTPN.tongTien) FROM CHITIETPHIEUNHAP CTPN where CTPN.MaPN = :maPN";
    @Query(value = QUERY_FOR_SUM, nativeQuery = true)
    Long calculateSumImport(@Param("maPN") int maPN);

    String QUERY_FOR_DELETE = "DELETE FROM CHITIETPHIEUNHAP CTPN where CTPN.MaPN = :maPN";
    @Query(value = QUERY_FOR_DELETE, nativeQuery = true)
    void deleteAllByImportProductID(@Param("maPN") int maPN);
}
