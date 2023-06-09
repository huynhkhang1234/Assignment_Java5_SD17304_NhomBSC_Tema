package com.poly.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountMANController {
	
	@GetMapping("/admin/account")
	public String view() {
		return "admin/account";
	}
	
}
