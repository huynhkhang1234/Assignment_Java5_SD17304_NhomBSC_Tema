package com.poly.Controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.Beans.Users_bean;
import com.poly.DAO.RolesDAO;
import com.poly.DAO.UsersDAO;
import com.poly.Entities.Categories_news;
import com.poly.Entities.News;
import com.poly.Entities.Users;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;

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
		model.addAttribute("users",entity);
		List<Users> list = userDao.findByEquals();
		model.addAttribute("list",list);
		return "admin/account";
	}
	
	
	@PostMapping("/account/create")
	public String Create(Model model,
			@Valid @ModelAttribute("users") Users entity, @RequestParam("file") MultipartFile file
			) {
		if (entity.getCreate_date() == null) 
			entity.setCreate_date(new Date());
		entity.setUpdate_date(new Date());
		
		/* Xử lý hình ảnh */
		String uploadRootPath = app.getRealPath("images/user-img/");
		File uploadRootDir = new File(uploadRootPath);
		if(!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		try {
			String fileName = file.getOriginalFilename();
			File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator + fileName);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(file.getBytes());
			stream.close();
			entity.setImages(fileName);
			}catch(Exception e) {
			model.addAttribute("message", "Lỗi upload file!");
		}
		
		this.userDao.saveAndFlush(entity);
		
		return "redirect:/admin/account";
		
	}
	
	
	@PostMapping("/account/update/{id}")
	public String update(Model model,  @ModelAttribute("users") Users entity, @PathVariable("id") Integer id, @RequestParam("file") MultipartFile file) {
		
		if (entity.getCreate_date() == null) 
			entity.setCreate_date(new Date());
		entity.setUpdate_date(new Date());
		
		entity.setIs_active(1);
		
		/* Xử lý hình ảnh */
		String uploadRootPath = app.getRealPath("images/user-img/");
		File uploadRootDir = new File(uploadRootPath);
		if(!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		try {
			String fileName = file.getOriginalFilename();
			File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator + fileName);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(file.getBytes());
			stream.close();
			entity.setImages(fileName);
			}catch(Exception e) {
			model.addAttribute("message", "Lỗi upload file!");
		}
		
		userDao.saveAndFlush(entity);
		return "redirect:/admin/account";
		
		
	}
	
	
	@GetMapping("/account/edit/{id}")
	public String edit(Model model, @ModelAttribute("users") Users entity, @PathVariable("id") Integer id) {
		
		entity = userDao.getOne(id);
		model.addAttribute("users",entity);
		List<Users> list = userDao.findAll();
		
		model.addAttribute("list",list);
		
		return "/admin/account";
	}
	
	@GetMapping("/account/delete/{id}")
	public String view(
			@ModelAttribute("users") Users entity, @PathVariable("id") Integer id
			) {
		
		entity = userDao.getOne(id);
		entity.setIs_active(0);
		
		userDao.saveAndFlush(entity);
		return "redirect:/admin/account";
	}
	
	
	
	@GetMapping("/account/close/{id}")
	public String Close(
			@ModelAttribute("users") Users entity, @PathVariable("id") Integer id
			) {
		entity = userDao.getOne(id);
		
		if(entity.getIs_active()== 1) {
			
			entity.setIs_active(3);
		}
		else 
			{
			
			entity.setIs_active(1);
		}
		userDao.saveAndFlush(entity);
		return "redirect:/admin/account";
	}
	
	
}
