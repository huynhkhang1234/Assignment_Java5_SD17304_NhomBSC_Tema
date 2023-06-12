package com.poly.Controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.sym;
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
import com.poly.DAO.DiscountsDAO;
import com.poly.DAO.ProductsDAO;
import com.poly.DAO.SuppliersDAO;
import com.poly.Entities.Categories;
import com.poly.Entities.Discounts;
import com.poly.Entities.Products;
import com.poly.Entities.Suppliers;

import jakarta.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductMANController {

	@Autowired
	ProductsDAO dao;

	@Autowired
	DiscountsDAO disdao;

	@Autowired
	CategoriesDAO catedao;
	
	@Autowired
	SuppliersDAO suppdao;

	@Autowired
	ServletContext app;

	@GetMapping("/admin/product")
	public String product(Model model, @ModelAttribute("product") Products ps) {

		// products
		Products entity = new Products();
		model.addAttribute("products", entity);
		List<Products> list = dao.findAll();
		model.addAttribute("list", list);
		

		List<Suppliers> listSupp = suppdao.findAll();
		model.addAttribute("listSupp", listSupp);

		// discounts
		Discounts entityDis = new Discounts();
		model.addAttribute("discounts", entityDis);
		List<Discounts> listDis = disdao.findAll();
		model.addAttribute("listDis", listDis);

		// categories
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

	@PostMapping("/admin/create")
	public String save(Model model, @ModelAttribute("product") Products entity) {
		/*
		 * @ModelAttribute("discounts") Discounts
		 * entityDis, @ModelAttribute("categories") Categories entityCate,
		 * 
		 * @RequestParam("file") MultipartFile file) {
		 * System.out.println(entity.getPrice()
		 */
		/*
		 * Xử lý hình ảnh String uploadRootPath =
		 * app.getRealPath("images/product-img/"); File uploadRootDir = new
		 * File(uploadRootPath); if(!uploadRootDir.exists()) { uploadRootDir.mkdirs(); }
		 * try { String fileName = file.getOriginalFilename(); File serverFile = new
		 * File(uploadRootDir.getAbsoluteFile() + File.separator + fileName);
		 * BufferedOutputStream stream = new BufferedOutputStream(new
		 * FileOutputStream(serverFile)); stream.write(file.getBytes()); stream.close();
		 * entity.setImages(fileName); }catch(Exception e) {
		 * model.addAttribute("message", "Lỗi upload file!"); }
		 */
		// products
		/*
		 * dao.saveAndFlush(entity);
		 * 
		 * // discounts disdao.saveAndFlush(entityDis);
		 * 
		 * // categories catedao.saveAndFlush(entityCate);
		 */

		return "/admin/product";
	}
	@PostMapping("/admin/save/product")
	public String saveProduct(Model model, @ModelAttribute("product") Products entity) {
		
		return "/admin/product";
		
	}

	@PostMapping("/admin/product/update/{id}")
	public String update(Model model, @ModelAttribute("products") Products entity,
			@PathVariable("id") Integer id, @RequestParam("cate") Categories cate,
			@RequestParam("supp") Suppliers supp,
			@RequestParam("dis") Discounts dis,
			@RequestParam("file") MultipartFile file) {
		
		Date now = new Date();

		entity.setCategories(cate);
		entity.setSuppliers(supp);
		entity.setDiscounts(dis);
		
		if(entity.getCreate_date() == null)
			entity.setCreate_date(now);
			entity.setUpdate_date(now);

		String uploadRootPath = app.getRealPath("images/product-img/");
		File uploadRootDir = new File(uploadRootPath);
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}
		try {
			String fileName = file.getOriginalFilename();
			File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator + fileName);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(file.getBytes());
			stream.close();
			entity.setImages(fileName);

		} catch (Exception e) {
			model.addAttribute("message", "Loi upload file");

		}

		// products
		dao.saveAndFlush(entity);

		return "redirect:/admin/product";
	}
	
	
	@PostMapping("/admin/discount/update/{id}")
	public String update(Model model, @ModelAttribute("discounts") Discounts entityDis,
			@PathVariable("id") Integer id,			
			@RequestParam("dis") Discounts dis) {
		
		Date now = new Date();
		
		if(entityDis.getStart_day() == null)
			entityDis.setStart_day(now);
			entityDis.setEnd_day(now);

		// discounts
		disdao.saveAndFlush(entityDis);

		return "redirect:/admin/product";
	}
	

	@GetMapping("/admin/delete/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {
		// products
		dao.deleteById(id);

		// discounts
		disdao.deleteById(id);

		// categories
		catedao.deleteById(id);

		return "redirect:/admin/product";
	}
	
	@GetMapping("/admin/discount/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id, @ModelAttribute("discounts") Discounts d) {
		
		// products
				Products entity = new Products();
				model.addAttribute("products", entity);
				List<Products> list = dao.findAll();
				model.addAttribute("list", list);
		
		// discounts

				d = disdao.getById(id);
				model.addAttribute("discounts", d);
				List<Discounts> listDis = disdao.findAll();
				model.addAttribute("listDis", listDis);
	
		
		return "/admin/product";
	}


}
