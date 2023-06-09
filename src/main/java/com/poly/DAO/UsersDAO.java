package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.Entities.Users;

@Repository
public interface UsersDAO extends JpaRepository<Users, Integer> {
	
	
	public Users findByEmailEquals(String email);

//	@Query(value = "SELECT user_names, first_names, last_names, roles_id FROM Users")
//	public List<Users> getDemo();
	
}	
