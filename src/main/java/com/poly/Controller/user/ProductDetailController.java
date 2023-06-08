package com.poly.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductDetailController {
	
	@GetMapping("/user/product")
	public String view() {
		return "user/detail";
	}
}
