package com.poly.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CheckoutController {
	
	@GetMapping("/user/cart/checkout")
	public String view() {
		// giỏ hàng
		return "user/checkout";
	}
	
}
