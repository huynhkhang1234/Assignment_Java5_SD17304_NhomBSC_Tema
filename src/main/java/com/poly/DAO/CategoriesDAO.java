package com.poly.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.Entities.Categories;

public interface CategoriesDAO extends JpaRepository<Categories, Integer> {
//	@Query("SELECT n FROM Categories n WHERE n.id = 1")
//	List<Categories> findAllActiveTrue();
}
