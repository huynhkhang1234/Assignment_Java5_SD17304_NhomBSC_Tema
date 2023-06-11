package com.poly.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewsMANController {
	
	@GetMapping("/admin/news")
	public String view() {
		return "admin/news";
	}
}
