package com.poly.Controller.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.Beans.Users_bean;
import com.poly.DAO.UsersDAO;
import com.poly.Entities.Roles;
import com.poly.Entities.Users;

import jakarta.validation.Valid;



@Controller
public class RegisterController {
	@Autowired
	private UsersDAO userDao;
	
	@GetMapping("/user/register")
	public String view() {
		return "user/register";
	}
	
	@PostMapping("/user/register")
	public String signup( @Valid @ModelAttribute("user") Users_bean model, BindingResult result) {
		if (result.hasErrors()) {
			return "/user/register";
		}
			
			else {
			Users acc = new Users();
			
			Roles roles = new Roles();
			roles.setId(2);
			roles.setRoles("user");
			roles.setActions("views");
			
			acc.setFirst_names(model.getFirst_names().trim());
			acc.setLast_names(model.getLast_names().trim());
			acc.setUser_names(model.getUser_names().trim());
			acc.setEmail(model.getEmail().trim());
			acc.setPass_words(model.getPass_words().trim());
			
			acc.setRoles(roles);
			
			this.userDao.save(acc);
			
			return "/user/login";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
