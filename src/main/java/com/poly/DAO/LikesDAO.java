package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Likes;


public interface LikesDAO extends JpaRepository<Likes, Integer> {

}
