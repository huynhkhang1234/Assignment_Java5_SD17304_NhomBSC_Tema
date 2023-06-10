package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Galleries;

public interface GalleriesDAO extends JpaRepository<Galleries, Integer>{
	
}
