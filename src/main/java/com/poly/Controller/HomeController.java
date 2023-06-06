package com.poly.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {
	@GetMapping("/home")
	public String home() {
		return "commons/home";
	}
	
	@GetMapping("/admin")
	public String homeAdmin() {
		return "admin/admin";
	}
}
