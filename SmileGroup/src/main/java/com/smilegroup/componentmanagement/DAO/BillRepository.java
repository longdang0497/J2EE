package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


public interface BillRepository extends CrudRepository<Bill, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM HOADON HD where MONTH(HD.NgayLap) = :thang";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Iterable<Bill> findBillByThang(@Param("thang") int thang);
}
