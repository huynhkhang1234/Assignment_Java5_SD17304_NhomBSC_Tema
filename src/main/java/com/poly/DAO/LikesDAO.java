package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Entities.Likes;


public interface LikesDAO extends JpaRepository<Likes, Integer> {
	
	/*
	 * @Query("SELECT l FROM LIKES WHERE l.users.id = ?1 AND l.products.id = ?2")
	 * List<Likes> findByUserAndProduct(Integer user_id, Integer product_id);
	 */

}
