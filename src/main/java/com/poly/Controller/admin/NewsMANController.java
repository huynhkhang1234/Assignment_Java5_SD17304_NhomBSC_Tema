package com.poly.Controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.DAO.CategoriesDAO;
import com.poly.DAO.Categories_newsDAO;
import com.poly.DAO.NewsDAO;
import com.poly.Entities.Categories_news;
import com.poly.Entities.News;

import jakarta.servlet.ServletContext;






@Controller
public class NewsMANController {
	@Autowired
	NewsDAO dao;
	
	@Autowired
	Categories_newsDAO cateNewsDao;
	
	@Autowired
	ServletContext app;
	
	@GetMapping("admin/news")
	public String index(Model model) {
		News entity= new News();
		model.addAttribute("news",entity);
		
		List<News> list = dao.findAllActiveTrue();
		
		List<Categories_news> listLoai = cateNewsDao.findAll();
		
		model.addAttribute("list",list);
		model.addAttribute("listLoai",listLoai);
		
		return "admin/news";
	}
	
	
	@PostMapping("admin/save")
	public String save(Model model, 
//			@ModelAttribute("news") News entity,
			@RequestParam("images") MultipartFile file) {
		
		//img
				String uploadRootPath = app.getRealPath("images/news-img");
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
					model.addAttribute("name", fileName);
					
				} catch (Exception e) {
					model.addAttribute("message", "Loi upload file");
					return "redirect:/admin/news";
				}
				
		
//				dao.save(entity);
				return "redirect:/admin/news";
		
		
		
		
		

		
		
		
	}
	
	@PostMapping("/admin/update/{id}")
	public String update(Model model,  @ModelAttribute("news") News entity) {
		dao.saveAndFlush(entity);
		return "redirect:/admin/news";
	}
//	
	@GetMapping("/admin/edit/{id}")
	public String edit(Model model, @ModelAttribute("news") News entity, @PathVariable("id") Integer id) {
		entity = dao.getOne(id);
		model.addAttribute("news",entity);
		List<News> list = dao.findAll();
		model.addAttribute("list",list);
		return "admin/news";
	}
	
	
	@GetMapping("/admin/delete/{id}")
	public String view(
			@ModelAttribute("news") News entity, @PathVariable("id") Integer id
			) {
		entity = dao.getOne(id);
		entity.setIs_active(0);
		
		dao.saveAndFlush(entity);
		return "redirect:/admin/news";
	}
}
