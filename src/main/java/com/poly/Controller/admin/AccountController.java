package com.poly.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {
	
	@GetMapping("/admin/index")
	public String view() {
		return "admin/index";
	}
	
	@GetMapping("/admin/order")
	public String order() {
		return "admin/Order_MAN";
	}
}
