package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.Entities.Users;

@Repository
public interface UsersDAO extends JpaRepository<Users, Integer> {
	
//	
//
	@Query(value = "SELECT acc FROM Users acc")
	public List<Users> getDemo();
	
	
	
}	
