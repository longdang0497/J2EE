package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.*;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeOfComponentRepository extends CrudRepository<TypeOfComponent, Integer> {}
//param truyền vào CrudRepository là model và kiểu dữ liệu của id
