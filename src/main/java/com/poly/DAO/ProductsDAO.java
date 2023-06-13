package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Products;

public interface ProductsDAO extends JpaRepository<Products, Integer> {
	@Query("SELECT p FROM Products p WHERE p.is_active = 1")
	List<Products> findAllActiveTrue();
	
	@Query("SELECT p FROM Products p WHERE id = :id")
	Products findByProductId(@Param("id") Integer id);
	
}
