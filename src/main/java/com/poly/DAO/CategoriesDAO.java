package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Categories;

public interface CategoriesDAO extends JpaRepository<Categories, Integer> {

}
