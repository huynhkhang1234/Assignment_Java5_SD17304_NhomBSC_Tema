package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.News;

public interface NewsDAO extends JpaRepository<News, Integer>  {
	

}
