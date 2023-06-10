package com.poly.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
	
	@GetMapping("/user/cart")
	public String view() {
		// giỏ hàng
		return "user/cart";
	}
	
	@GetMapping("/user/order")
	public String view2() {
		// giỏ hàng
		return "/admin/product";
	}
}
