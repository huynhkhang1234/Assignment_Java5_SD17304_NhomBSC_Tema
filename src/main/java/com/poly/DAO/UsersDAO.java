package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.Entities.Users;

public interface UsersDAO extends JpaRepository<Users, Integer> {
	@Query("SELECT u FROM Users u WHERE u.email = :email")
	Users findByEmail(@Param("email") String email);
	
	@Query("SELECT u FROM Users u WHERE u.user_names = :users")
	Users findByUsername(@Param("users") String users);
	
	public Users findByEmailEquals(String email);

//	@Query(value = "SELECT user_names, first_names, last_names, roles_id FROM Users")
//	public List<Users> getDemo();
	
}	
