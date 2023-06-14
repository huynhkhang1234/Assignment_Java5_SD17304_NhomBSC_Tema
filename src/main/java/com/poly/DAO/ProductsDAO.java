package com.poly.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Products;

public interface ProductsDAO extends JpaRepository<Products, Integer> {
	@Query("SELECT p FROM Products p WHERE p.is_active = 1")
	List<Products> findAllActiveTrue();
	
	@Query("SELECT p FROM Products p WHERE p.is_active = 1")
	Page<Products> findAllActiveTrue(Pageable pageable);
	
	@Query("SELECT p FROM Products p WHERE id = :id")
	Products findByProductId(@Param("id") Integer id);
	
	/*
	 * @Query(value = "SELECT COUNT(p) FROM Products p WHERE p.is_active = 1",
	 * nativeQuery = false) long countProducts();
	 * 
	 * @Query(value = "SELECT p FROM Products p WHERE p.is_active = 1", nativeQuery
	 * = false) List<Products> findAllProducts(Pageable pageable);
	 */	
}
