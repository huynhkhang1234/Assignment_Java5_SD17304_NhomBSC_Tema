package com.poly.Controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poly.DAO.ProductsDAO;
import com.poly.service.CartItem;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;

	@Autowired
	private ProductsDAO productRepo;

	@GetMapping("/addCart")
	public String showCart() {

		try {
			HttpSession session = request.getSession();
			// String gioHang = (String) session.getAttribute("cart");
			System.out.println(session.getAttribute("cart") + "giỏ hàng đầu vô");
			// System.out.println("giỏ hàng đầu vô :" + gioHang);
		} catch (Exception e) {
			System.out.println("session giỏ hàng null");
		}

		// System.out.println("giỏ hàng 1:" + cart.get(1).getQuantity());
//		
//		System.out.println("giỏ hàng 2 :" + cart.get(2).getName());		
//		System.out.println("giỏ hàng 2:" + cart.get(2).getQuantity());
		return "user/buy_products";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public String addToCart() {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));

		CartItem item = new CartItem(id, name, quantity, price);
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Integer, CartItem>();
		}
		if (cart.containsKey(id)) {
			CartItem existingItem = cart.get(id);
			existingItem.setQuantity(existingItem.getQuantity() + quantity);
		} else {
			cart.put(id, item);
		}
		session.setAttribute("cart", cart);
		try {
			System.out.println("giỏ hàng 1 :" + cart.get(1).getName());
			System.out.println("giỏ hàng 1:" + cart.get(1).getQuantity());

			System.out.println("giỏ hàng 2 :" + cart.get(2).getName());
			System.out.println("giỏ hàng 2:" + cart.get(2).getQuantity());
		} catch (Exception e) {
			System.out.println("Gio hàng in ra 1 trong 2  null");
		}
		return "user/cart";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addCart2", method = RequestMethod.POST)
	public String addToCart2() {
		int id = Integer.parseInt(request.getParameter("id2"));
		String name = request.getParameter("name2");
		int quantity = Integer.parseInt(request.getParameter("quantity2"));
		double price = Double.parseDouble(request.getParameter("price2"));

		CartItem item = new CartItem(id, name, quantity, price);
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Integer, CartItem>();
		}
		if (cart.containsKey(id)) {
			CartItem existingItem = cart.get(id);
			existingItem.setQuantity(existingItem.getQuantity() + quantity);
		} else {
			cart.put(id, item);
		}
		session.setAttribute("cart", cart);
		try {
			System.out.println("giỏ hàng 1 :" + cart.get(1).getName());
			System.out.println("giỏ hàng 1:" + cart.get(1).getQuantity());

			System.out.println("giỏ hàng 2 :" + cart.get(2).getName());
			System.out.println("giỏ hàng 2:" + cart.get(2).getQuantity());
		} catch (Exception e) {
			System.out.println("Gio hàng in ra null");
		}
		return "user/cart";
	}

	// nhấn nút lưu tren kia
	
	
	@RequestMapping(value = "/saveCart", method = RequestMethod.POST, produces = "application/json")
	public String saveCart() {
//		int id = Integer.parseInt(request.getParameter("id"));
//		String name = request.getParameter("name");
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		double price = Double.parseDouble(request.getParameter("price"));
		//Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart"); // Thực hiện lưu thông
		// tin giỏ hàng vào cơ sở dữ liệu ở đây Products pro =
		//System.out.println("gio hang database : " +cart.values());
//		this.productRepo.findById(id).get();
//		System.err.println(pro);
//		session.removeAttribute("cart");
		return "user/cart";
	}

	// suwr li ajax.
//	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
//	<script>
//	   function addToCart() {
//	       var id = $("#productId").val();
//	       var name = $("#productName").val();
//	       var quantity = $("#quantity").val();
//	       var price = $("#price").val();
//	       $.ajax({
//	           type: "POST",
//	           url: "/addCart",
//	           data: {
//	               id: id,
//	               name: name,
//	               quantity: quantity,
//	               price: price
//	           },
//	           success: function(data) {
//	               alert("Thêm vào giỏ hàng thành công");
//	           },
//	           error: function(data) {
//	               alert("Có lỗi xảy ra");
//	           }
//	       });
//	   }
//	   // luu data
//	   function saveCart() {
//	       $.ajax({
//	           type: "POST",
//	           url: "/saveCart",
//	           success: function(data) {
//	               alert("Lưu giỏ hàng thành công");
//	           },
//	           error: function(data) {
//	               alert("Có lỗi xảy ra");
//	           }
//	       });
//	   }
//	</script>

	///

}
