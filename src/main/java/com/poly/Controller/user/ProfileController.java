package com.poly.Controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.DAO.LikesDAO;
import com.poly.Entities.Likes;
import com.poly.Entities.Users;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	
	@Autowired
	LikesDAO lDAO;
	
	@Autowired
	HttpSession session;
	
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
		loadData(m);
		
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
	
	private void loadData(Model m) {
				// Lấy tài khoản của thằng đang đăng nhập
				Users userC = (Users) session.getAttribute("userLogin");
				
				List<Likes> list = lDAO.findAllLikesByUserID(userC.getId());
				
				m.addAttribute("listLike", list);
	}
	
}
