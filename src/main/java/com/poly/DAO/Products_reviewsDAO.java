package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Entities.Products_reviews;

public interface Products_reviewsDAO extends JpaRepository<Products_reviews, Integer>  {
//	@Query("SELECT f FROM Products_reviews f WHERE f.users.id = ?1 AND f.orders.order_details.products.id = ?2")
//	List<Products_reviews> findProductByUserId(Integer user_id, Integer product_id);
	
	@Query("SELECT f FROM Products_reviews f WHERE f.products.id = ?1")
	List<Products_reviews> findByProductID(Integer product_id);
}
