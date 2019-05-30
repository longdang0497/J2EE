package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BillInfoRepository extends CrudRepository<BillInfo, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM CHITIETHOADON CTHD where CTHD.MaHD = :maHD";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    List<BillInfo> findByBillID(@Param("maHD") int maHD);
}
