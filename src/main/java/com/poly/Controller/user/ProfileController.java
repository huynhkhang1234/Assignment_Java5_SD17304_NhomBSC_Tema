package com.poly.Controller.user;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
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

import com.poly.DAO.UsersDAO;
import com.poly.Entities.Users;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.poly.DAO.LikesDAO;
import com.poly.DAO.OrdersDAO;
import com.poly.DAO.ProductsDAO;
import com.poly.DAO.Products_reviewsDAO;
import com.poly.Entities.Likes;
import com.poly.Entities.Order_details;
import com.poly.Entities.Orders;
import com.poly.Entities.Products;
import com.poly.Entities.Products_reviews;
import com.poly.Entities.Users;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	@Autowired
	UsersDAO userDao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest req;
	
	@Autowired
	LikesDAO lDAO;
	
	@Autowired
	ProductsDAO pDAO;
	
	@Autowired
	OrdersDAO oDAO;
	
	@Autowired
	Products_reviewsDAO prDAO;
	
	@Autowired
	ServletContext app;
	
	@GetMapping("/user/profile/account")
	public String viewAccount( Model m,@ModelAttribute("users") Users users ) {
		
		Users u = (Users) session.getAttribute("userLogin");
		
		List<Likes> listLike = lDAO.findAllByUserId(u.getId());
		List<Orders> listOrder = oDAO.findByUserId(u.getId());
		

		m.addAttribute("users", u);
		m.addAttribute("listLike", listLike);
		m.addAttribute("listOrder", listOrder);
		m.addAttribute("url", "account");
		
		return "user/profile";
		
	}
	
	@PostMapping("/user/profile/account/star/{id}")
	public String viewAccount2( Model m,@ModelAttribute("users") Users users, @PathVariable("id") Integer id) {
		
		Users u = (Users) session.getAttribute("userLogin");
		
		List<Likes> listLike = lDAO.findAllByUserId(u.getId());
		List<Orders> listOrder = oDAO.findByUserId(u.getId());
		
		List<Products_reviews> listPR = new ArrayList<>();
		
		for (Orders orders : listOrder) {
			if (orders.getId() == id) {
				for (Order_details od : orders.getOrder_details()) {
					Products_reviews pr = new Products_reviews();
					String numberStar = req.getParameter("star" + od.getId());
					String content = req.getParameter("content" + od.getId());
					
					pr.setIs_active(1);
					pr.setOrders(orders);
					pr.setStars_number(Integer.parseInt(numberStar));
					pr.setContent(content);
					pr.setUsers(u);
					pr.setProducts(od.getProducts());
					
					listPR.add(pr);
				}
			}
		}
		
		for (Products_reviews products_reviews : listPR) {
			prDAO.save(products_reviews);
		}
		
		

		m.addAttribute("users", u);
		m.addAttribute("listLike", listLike);
		m.addAttribute("listOrder", listOrder);
		m.addAttribute("url", "account");
		
		return "user/profile";
		
	}
	
	@PostMapping("/user/profile/account/{id}")
	public String viewAccountUpdate(
			Model m, 
			@ModelAttribute("users") Users users, 
			@PathVariable("id") Integer id,
			@RequestParam("file") MultipartFile file) {
		
		String txtPassword = req.getParameter("txtPassword");
		String txtConfirmPassword = req.getParameter("txtConfirmPassword");
		
		if (txtPassword.equals(txtConfirmPassword)) {
			Users u = (Users) session.getAttribute("userLogin");
			
			
			u.setPass_words(txtConfirmPassword);
			
			if (file.getOriginalFilename() == null || file.getOriginalFilename().length() == 0) {
				Users user = userDao.getById(users.getId());

				if (!(user.getImages() == null || user.getImages().length() == 0)) {
					u.setImages(user.getImages());
				}
			}
			
			String uploadRootPath = app.getRealPath("images/user-img/"); 
			File uploadRootDir = new File(uploadRootPath); 
			  
			  if(!uploadRootDir.exists()) { 
				  uploadRootDir.mkdirs(); 
			  }
			  try { 
				  String fileName = file.getOriginalFilename(); 
				  File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator + fileName);
				  BufferedOutputStream stream = new BufferedOutputStream(new
				  FileOutputStream(serverFile)); 
				  stream.write(file.getBytes()); 
				  stream.close();
				  u.setImages(fileName); 
			  }
			  
			  catch(Exception e) {
			  m.addAttribute("message", "Lỗi upload file!"); }
			
			 userDao.saveAndFlush(u);
			System.out.println("thành công");
		}
		
		return "redirect:/user/profile/account";
	}
	
	
	
	@GetMapping("/user/profile/profile")
	public String viewProfile( Model m) {
		
		m.addAttribute("url", "profile");
		return "user/profile";
		
	}
	
	@GetMapping("/user/profile/favorite")
	public String viewFavorite( 
			Model m
			) {
		
		m.addAttribute("url", "favorite");
		return "user/profile";
	}
	
	@GetMapping("/user/profile/history")
	public String viewHistory( 
			Model m
			) {
		m.addAttribute("url", "history");
		return "user/profile";
	}
	
	private void loadData(Model m) {
				// Lấy tài khoản của thằng đang đăng nhập
				Users userC = (Users) session.getAttribute("userLogin");
				
				List<Likes> list = lDAO.findAllLikesByUserID(userC.getId());
				
				m.addAttribute("listLike", list);
	}
	
}
