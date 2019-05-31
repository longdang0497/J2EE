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
}
