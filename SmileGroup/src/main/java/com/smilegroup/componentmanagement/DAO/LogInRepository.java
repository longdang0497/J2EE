package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LogInRepository extends CrudRepository<LogIn, Integer> {
    String QUERY_BY_NAME = "SELECT * FROM DANGNHAP dn where dn.Username = :username AND dn.Password = :password";
    @Query(value = QUERY_BY_NAME, nativeQuery = true)
    Optional<LogIn> findByUser(@Param("username") String username, @Param("password") String password);

    String QUERY_USER_BY_ID = "SELECT * FROM DANGNHAP dn where dn.MaNV = :maNV AND dn.MaPQ = :maPQ";
    @Query(value = QUERY_USER_BY_ID, nativeQuery = true)
    Optional<LogIn> findByUserByID(@Param("maNV") int maNV, @Param("maPQ") int maPQ);
}
//param truyền vào CrudRepository là model và kiểu dữ liệu của id