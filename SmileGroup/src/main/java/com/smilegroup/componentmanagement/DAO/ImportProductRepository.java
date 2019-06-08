package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface ImportProductRepository extends CrudRepository<ImportProduct, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM PHIEUNHAPHANG PN where MONTH(PN.NgayLapPhieu) = :thang";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Iterable<ImportProduct> findImportByThang(@Param("thang") int thang);
}
