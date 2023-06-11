package com.poly.Controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewDetailController {
	
	@GetMapping("/user/news/detail")
	public String view() {
		// giỏ hàng
		return "user/news-detail";
	}
	
}
