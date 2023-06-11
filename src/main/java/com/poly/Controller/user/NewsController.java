package com.poly.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewsController {
	
	@GetMapping("/user/news")
	public String view() {
		// giỏ hàng
		return "user/news";
	}
	
}
