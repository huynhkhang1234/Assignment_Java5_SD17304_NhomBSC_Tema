package com.poly.DAO;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Orders;

public interface OrdersDAO extends JpaRepository<Orders, Integer> {
	@Query("SELECT o FROM Orders o WHERE o.id = :id")
	Orders findByUserID(@Param("id") int id);
//	@Query(value="select  Users.id from Orders join Users on Users.id = Orders.users_id where Users.id = ?1",nativeQuery = true)
//	List<Orders> findByUserID(int id);
	
	@Query("SELECT o FROM Orders o WHERE o.create_date BETWEEN ?1 AND ?2")
	List<Orders> findByCreateDateBetween(java.sql.Date startDate, java.sql.Date endDate);
}
