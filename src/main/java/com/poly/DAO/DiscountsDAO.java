package com.poly.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.Entities.Discounts;

public interface DiscountsDAO  extends JpaRepository<Discounts, Integer> {

}
