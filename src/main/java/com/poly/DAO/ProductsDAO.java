package com.poly.DAO;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Products;

public interface ProductsDAO extends JpaRepository<Products, Integer> {
	@Query("SELECT p FROM Products p WHERE p.is_active = 1")
	List<Products> findAllActiveTrue();
	@Query("SELECT p FROM Products p WHERE p.is_active = 1")
	List<Products> findAllActiveTrue(Sort sort);
	
	
	
	@Query("SELECT p FROM Products p WHERE p.is_active = 1")
	Page<Products> findAllActiveTrue(Pageable pageable);
	
	@Query("SELECT p FROM Products p WHERE id = :id")
	Products findByProductId(@Param("id") Integer id);
	
	@Query(value = "SELECT n FROM Products n where n.is_active = 1")
	Page<Products> getIsActive(Pageable pageable);
	// tìm kiếm sản phẩm
	/*
	 * @Query(value =
	 * "select * from products p where p.titles  like '%Màn%' and p.is_active = 1"
	 * ,nativeQuery = true) List<Products> findByNamePage();
	 */
	
	@Query("SELECT p FROM Products p WHERE p.titles LIKE ?1 and p.is_active = 1")
	Page<Products> findByNamePage(String name, Pageable pageable);
	

}
