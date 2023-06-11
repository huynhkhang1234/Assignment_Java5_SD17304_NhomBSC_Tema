package com.poly.Controller.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.poly.service.CartItem;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	HttpSession session;

	@GetMapping("/user/cart")
	public String view(Model model) {
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Integer, CartItem>();
		} else {
			model.addAttribute("listCart", cart);
		}

		return "user/cart";
	}
	
	@PostMapping("/delete/cart")
	public String delete(Model model,@RequestBody CartItem test) {
		int id = test.getId();
		System.out.println("Du lieu truyen qua: "+test.getId());
		
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Integer, CartItem>();
		} else {
			
			float total = (float) session.getAttribute("total");
			float price = total - (cart.get(id).getPrice()*cart.get(id).getQuantity());
			cart.remove(id);
			session.setAttribute("total", price);
			System.out.println(session.getAttribute("total"));
			
		}

		return "user/cart";
	}
	
	@GetMapping("/user/order")
	public String view2() {
		// giỏ hàng
		return "/admin/product";
	}
}
