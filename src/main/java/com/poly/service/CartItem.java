package com.poly.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CartItem {

	private int id;
	private String name;
	private int quantity;
	private float price;
	private String images;
	private float orderMoney;

}
