package com.poly.Controller.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.Beans.Users_bean;
import com.poly.DAO.UsersDAO;
import com.poly.Entities.Roles;
import com.poly.Entities.Users;



@Controller
public class RegisterController {
	@Autowired
	private UsersDAO userDao;
	
	@GetMapping("/user/register")
	public String view(Users_bean model) {
		return "user/register";
	}
	
	@PostMapping("/user/register")
	public String signup(Users_bean model, BindingResult result) {
		if (result.hasErrors()) {
			return "/user/register";
		}
			
			else {
			Users acc = new Users();
			Roles roles = new Roles();
			acc.setUser_names(model.getUser_names().trim());
			acc.setFirst_names(model.getFirst_names().trim());
			acc.setLast_names(model.getLast_names().trim());
			acc.setEmail(model.getEmail().trim());
			acc.setPass_words(model.getPass_words().trim());
			roles.setId(2);
			roles.setRoles("user");
			acc.setRoles(roles);
			
			this.userDao.save(acc);
			return "/user/register";
		}
		
	}
	
	
	
<<<<<<< HEAD
=======
	
	
	
	
	
	
	
	
>>>>>>> parent of d90bdff (register)
}
