package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Orders;

public interface OrdersDAO extends JpaRepository<Orders, Integer> {

}
