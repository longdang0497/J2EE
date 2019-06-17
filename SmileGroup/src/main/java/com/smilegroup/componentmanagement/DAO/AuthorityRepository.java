package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AuthorityRepository extends CrudRepository<Authority, Integer> {
//    String QUERY_BY_NAME = "SELECT * FROM DANGNHAP dn where dn.Username = :username AND dn.Password = :password";
//    @Query(value = QUERY_BY_NAME, nativeQuery = true)
//    Optional<LogIn> findByUser(@Param("username") String username, @Param("password") String password);
}
//param truyền vào CrudRepository là model và kiểu dữ liệu của id
