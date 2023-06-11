package com.poly.Controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.RolesDAO;
import com.poly.DAO.UsersDAO;
import com.poly.Entities.Categories_news;
import com.poly.Entities.News;
import com.poly.Entities.Users;

import jakarta.servlet.ServletContext;

@Controller
public class AccountMANController {
	
	@Autowired
	UsersDAO userDao;
	@Autowired
	RolesDAO rolesDao;
	
	@Autowired
	ServletContext app;
	
	
	@GetMapping("admin/account")
	public String index(Model model) {
		
		Users entity= new Users();
		model.addAttribute("news",entity);
		
		List<Users> list = userDao.findAll();
		
		model.addAttribute("list",list);
		
		return "admin/account";
	}
	
	@PostMapping("/admin/account")
	public String save(Model model, @ModelAttribute("category") Users entity) {
//		if(dao.getOne(entity.getId()) == null) {
		userDao.save(entity);
//		}		
		return "redirect:/admin/account";
	}
	
	
	
	@PostMapping("/account/update/{id}")
	public String update(Model model,  @ModelAttribute("news") Users entity) {
		
		userDao.saveAndFlush(entity);
		return "redirect:/admin/account";
	}
	
	
	@GetMapping("account/edit/{id}")
	public String edit(Model model, @ModelAttribute("news") Users entity, @PathVariable("id") Integer id) {
		
		entity = userDao.getOne(id);
		model.addAttribute("news",entity);
		List<Users> list = userDao.findAll();
		
		model.addAttribute("list",list);
		
		return "admin/account";
	}
	
	@GetMapping("account/delete/{id}")
	public String view(
			@ModelAttribute("news") Users entity, @PathVariable("id") Integer id
			) {
		entity = userDao.getOne(id);
		entity.setIs_active(0);
		
		userDao.saveAndFlush(entity);
		return "redirect:/admin/account";
	}
	
}
