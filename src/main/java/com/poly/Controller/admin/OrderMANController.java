package com.poly.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderMANController {
	
	@GetMapping("/admin/order")
	public String view() {
		return "admin/order";
	}
}
