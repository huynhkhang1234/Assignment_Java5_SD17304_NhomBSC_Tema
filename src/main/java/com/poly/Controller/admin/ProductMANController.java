package com.poly.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductMANController {
	
	@GetMapping("/admin/product")
	public String view() {
		return "admin/product";
	}
}
