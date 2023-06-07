package com.poly.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomepageMANController {
	
	@GetMapping("/admin/index")
	public String view() {
		return "admin/index";
	}
}
