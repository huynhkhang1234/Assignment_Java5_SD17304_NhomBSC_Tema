package com.poly.Controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.poly.DAO.NewsDAO;
import com.poly.Entities.News;

@Controller
public class NewsMANController {
	
	@Autowired
	NewsDAO dao;
	
	@GetMapping("/admin/news")
	public String view() {
		return "admin/news";
	}
	
	@GetMapping("/admin/news?delete={id}")
	public String view(
			@PathVariable("id") Integer ID
			) {
		News entity = dao.getById(ID);
		entity.setIs_active(0);
		
		dao.saveAndFlush(entity);
		return "admin/news";
	}
}
