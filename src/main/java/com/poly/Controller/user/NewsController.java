package com.poly.Controller.user;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.DAO.NewsDAO;
import com.poly.Entities.Categories_news;
import com.poly.Entities.News;

@Controller
public class NewsController {
	@Autowired
	NewsDAO dao;
	
	@GetMapping("/user/news")
	public String view(Model model) {
		News entity = new News();
		model.addAttribute("news", entity);


		List<News> list = dao.findAllActiveTrue();

		model.addAttribute("list", list);

		
	
		return "user/news";
	}
	
}
