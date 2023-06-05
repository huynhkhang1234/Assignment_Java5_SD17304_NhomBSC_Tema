package com.poly.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.Beans.LoginBean;
import com.poly.DAO.UsersDAO;

import jakarta.validation.Valid;
@Controller
public class LoginController {
	@Autowired
	UsersDAO dao;
	
	@GetMapping("/login")
	public String login(@ModelAttribute("login") LoginBean bean) {
		return "commons/login";
	}	

	@PostMapping("/login")
	public String isLogin(@RequestParam(name="email" ) String email,
			@RequestParam(name="pass_words") String password,
			@Valid @ModelAttribute("login") LoginBean bean,BindingResult result
			) {
			System.out.println(email);
			System.out.println(password);
			if(result.hasErrors()) {
				System.out.println("Có lỗi");
				return"commons/login";
			}else {
				System.out.println("Đăng nhập thành công");
				//Users userLogin =  this.dao.findByEmailEquals(email);
				//System.out.println(userLogin);
				//System.out.println(userLogin);	
				return "redirect:/home";
			}
		
	}
}
