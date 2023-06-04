package com.poly.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.DAO.ProductsDAO;
import com.poly.Entities.Products;

@Controller
public class Test_KetNoiSQL {
	@Autowired
	ProductsDAO dao;

	@ResponseBody
	@RequestMapping("/product/list")
	public List<Products> list() {
		Sort sort = Sort.by(Direction.DESC, "id");	
		return dao.findAll(sort);
	}
	
	@GetMapping("/product/sort")
	public String sort(Model model, @RequestParam("field") Optional<String> field) {
		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));		
		List<Products> list = dao.findAll(sort);
		model.addAttribute("list", list);
		return "index";
	}
	
	
	
}
