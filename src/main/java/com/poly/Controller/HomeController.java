package com.poly.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.ProductsDAO;
import com.poly.Entities.Products;

import jakarta.servlet.http.HttpSession;
@Controller
public class HomeController {
	@Autowired
	ProductsDAO proRepo;
	
	@Autowired
	HttpSession sessoin;
	@GetMapping("/home")
	public String home(Model model) {
		List<Products> list = this.proRepo.findAll();
		model.addAttribute("listProduct", list);		
		return "commons/home";
	}
	
	@GetMapping("/admin")
	public String homeAdmin() {
		return "admin/admin";
	}
	
	@GetMapping(value = "/user/cart")
	public String delete(Model m) {	
		
		m.addAttribute("listCart",sessoin.getAttribute("cart"));		
		return "user/cart";
	}
	@PostMapping(value = "/user/saveCart")
	public String delete2(Model m) {	
		m.addAttribute("listCart",sessoin.getAttribute("cart"));		
		return "user/cart";
	}
}
