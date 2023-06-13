package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Entities.Likes;


public interface LikesDAO extends JpaRepository<Likes, Integer> {
	
	 @Query("SELECT l FROM Likes l WHERE l.users.id = ?1")
	 List<Likes> findAllLikesByUserID(Integer user_id);
	

}
