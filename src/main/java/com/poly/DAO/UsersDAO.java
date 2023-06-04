package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Users;


public interface UsersDAO extends JpaRepository<Users, Integer> {
	
	
}	
