package com.poly.Controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.DAO.LikesDAO;
import com.poly.Entities.Likes;

@Controller
public class ProfileController {
	
	@Autowired
	LikesDAO lDAO;
	
	@GetMapping("/user/profile/account")
	public String viewAccount( 
			Model m
			) {
		m.addAttribute("url", "account");
		return "user/profile";
	}
	
	@GetMapping("/user/profile/profile")
	public String viewProfile( 
			Model m
			) {
		m.addAttribute("url", "profile");
		return "user/profile";
	}
	
	@GetMapping("/user/profile/favorite")
	public String viewFavorite( 
			Model m
			) {
		
		List<Likes> list = lDAO.findAll();
		
		m.addAttribute("listLike", list);
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
