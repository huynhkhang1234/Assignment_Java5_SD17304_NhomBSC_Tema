package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Entities.News;

public interface NewsDAO extends JpaRepository<News, Integer>  {
	@Query("SELECT p FROM News p WHERE p.price BETWEEN ?1 AND ?2")
	List<News> findByPrice(Double min, Double max);
	
}
