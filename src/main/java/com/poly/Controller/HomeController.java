package com.poly.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.DAO.ProductsDAO;
import com.poly.Entities.Products;
@Controller
public class HomeController {
	@Autowired
	ProductsDAO proRepo;
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
}
