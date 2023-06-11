package com.poly.Controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.DAO.UsersDAO;
import com.poly.Entities.Users;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	@Autowired
	UsersDAO userDao;
	@Autowired
	HttpSession session;
	
	
	@GetMapping("/user/profile/account")
	public String viewAccount( Model m
//			,@ModelAttribute("user") Users users, @RequestParam("file") MultipartFile file
			) {
		
//		Users u = (Users) session.getAttribute("userLogin");
//		
//		m.addAttribute("user", u);
//		
//		userDao.saveAndFlush(users);
//		
		
		
		m.addAttribute("url", "account");
		return "user/profile";
		
	}
	
	@GetMapping("/user/profile/profile")
	public String viewProfile( Model m) {
		
		m.addAttribute("url", "profile");
		return "user/profile";
		
	}
	
	@GetMapping("/user/profile/favorite")
	public String viewFavorite( 
			Model m
			) {
		m.addAttribute("url", "favorite");
		return "user/profile";
	}
	
	@GetMapping("/user/profile/history")
	public String viewHistory( 
			Model m
			) {
		m.addAttribute("url", "history");
		return "user/profile";
	}
	
}
