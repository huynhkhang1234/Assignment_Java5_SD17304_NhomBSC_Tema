package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Products;

public interface ProductsDAO extends JpaRepository<Products, Integer> {
	
}
