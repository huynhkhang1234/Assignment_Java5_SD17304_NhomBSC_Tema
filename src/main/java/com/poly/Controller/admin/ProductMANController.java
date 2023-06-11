package com.poly.Controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.poly.DAO.CategoriesDAO;
import com.poly.DAO.DiscountsDAO;
import com.poly.DAO.ProductsDAO;
import com.poly.Entities.Categories;
import com.poly.Entities.Discounts;
import com.poly.Entities.Products;

@Controller
public class ProductMANController {
	
	@Autowired
	ProductsDAO dao;
	
	@Autowired
	DiscountsDAO disdao;
	
	@Autowired
	CategoriesDAO catedao;
	
	@GetMapping("/admin/product")
	public String product(Model model) {
		
		//products
		Products entity = new Products();
		model.addAttribute("products", entity);
		List<Products> list = dao.findAll();
		model.addAttribute("list", list);
		
		//discounts
		Discounts entityDis = new Discounts();
		model.addAttribute("discounts", entityDis);
		List<Discounts> listDis = disdao.findAll();
		model.addAttribute("listDis", listDis);
		
		//categories
		Categories entityCate = new Categories();
		model.addAttribute("categories", entityCate);
		List<Categories> listCate = catedao.findAll();
		model.addAttribute("listCate", listCate);
		
		return "admin/product";
	}
	
	@GetMapping("/admin/reset")
	public String reset() {
		return "redirect:/admin/product";
	}
	
	@PostMapping("/admin/save")
	public String save(Model model, @ModelAttribute("products") Products entity, @ModelAttribute("discounts") Discounts entityDis,
			@ModelAttribute("categories") Categories entityCate) {
		//products
		dao.save(entity);
		
		//discounts
		disdao.save(entityDis);
		
		//categories
		catedao.save(entityCate);
		
		return "redirect:/admin/product";
	}
	
	@PostMapping("/admin/update/{id}")
	public String update(Model model, @ModelAttribute("products") Products entity, @ModelAttribute("discounts") Discounts entityDis,
			@ModelAttribute("categories") Categories entityCate) {
		//products
		dao.saveAndFlush(entity);
		
		//discounts
		disdao.saveAndFlush(entityDis);
		
		//categories
		catedao.saveAndFlush(entityCate);
		
		return "redirect:/admin/product";
	}
	
	@GetMapping("/admin/delete/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {
		//products
		dao.deleteById(id);
		
		//discounts
		disdao.deleteById(id);
		
		//categories
		catedao.deleteById(id);
		
		return "redirect:/admin/product";
	}
	
	@GetMapping("/admin/edit/{id}")
	public String edit(Model model, @ModelAttribute("products") Products entity, @ModelAttribute("discounts") Discounts entityDis, 
			@ModelAttribute("categories") Categories entityCate, @PathVariable("id") Integer id) {
		
		//products
		entity = dao.getOne(id);
		model.addAttribute("products", entity);
		List<Products> list = dao.findAll();
		model.addAttribute("list", list);
				
		//discounts
		entityDis = disdao.getOne(id);
		model.addAttribute("discounts", entityDis);
		List<Discounts> listDis = disdao.findAll();
		model.addAttribute("listDis", listDis);
		
		//categories
		entityCate = catedao.getOne(id);
		model.addAttribute("categories", entityCate);
		List<Categories> listCate = catedao.findAll();
		model.addAttribute("listCate", listCate);
		
		return "admin/product";
	}
	
}
