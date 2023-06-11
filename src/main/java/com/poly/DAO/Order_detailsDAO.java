package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Entities.Order_details;

public interface Order_detailsDAO  extends JpaRepository<Order_details, Integer> {
	

}
