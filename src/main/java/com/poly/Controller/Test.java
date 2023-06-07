package com.poly.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Test {
	
	@GetMapping("/admin/index")
	public String view() {
		return "admin/Index_MAN";
	}
	
	@GetMapping("/admin/order")
	public String order() {
		return "admin/Order_MAN";
	}
}
