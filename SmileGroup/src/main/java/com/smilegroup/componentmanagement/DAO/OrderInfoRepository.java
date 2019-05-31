package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Optional;

public interface OrderInfoRepository extends CrudRepository<OrderInfo, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM CHITIETDONDATHANG CTDH where CTDH.MaDDH = :maDDH";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Iterable<OrderInfo> findByOrderID(@Param("maDDH") int maDDH);
}
