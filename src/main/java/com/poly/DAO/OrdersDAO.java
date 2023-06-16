package com.poly.DAO;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Orders;

public interface OrdersDAO extends JpaRepository<Orders, Integer> {
	@Query("SELECT o FROM Orders o WHERE o.id = :id")
	Orders findByOrderID(@Param("id") int id);
	
	@Query("SELECT o FROM Orders o WHERE o.users.id = ?1")
	List<Orders> findByUserId(Integer id);
	
	@Query("SELECT o FROM Orders o WHERE o.users.id = ?1")
	Orders findByUserID(Integer id);
	
	@Query("SELECT o FROM Orders o WHERE o.create_date BETWEEN ?1 AND ?2")
	List<Orders> findByCreateDateBetween(java.sql.Date startDate, java.sql.Date endDate);
	
	@Query("SELECT o FROM Orders o WHERE o.create_date BETWEEN ?1 AND ?2")
	Page<Orders> findByCreateDateBetween(java.sql.Date startDate, java.sql.Date endDate, Pageable pageable);
}
