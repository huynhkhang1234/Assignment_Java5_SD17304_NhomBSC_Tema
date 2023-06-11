package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.Entities.News;
import com.poly.Entities.Users;

@Repository
public interface UsersDAO extends JpaRepository<Users, Integer> {
	
	
	@Query("SELECT u FROM Users u WHERE u.email = :email")
	Users findByEmail(@Param("email") String username);
	
	public Users findByEmailEquals(String email);

	
	
//	@Query(value = "SELECT user_names, first_names, last_names, roles_id FROM Users")
//	public List<Users> getDemo();
	
	@Query(value = "SELECT acc FROM Users acc")
	public List<Users> getDemo();
	
	
	@Query("SELECT n FROM Users n where n.is_active = 1 or n.is_active = 3")
	List<Users> findByEquals();
	
	
}	
