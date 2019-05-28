package com.smilegroup.componentmanagement.DAO;

import com.smilegroup.componentmanagement.Models.Customer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer> {} //param truyền vào CrudRepository là model và kiểu dữ liệu của id
