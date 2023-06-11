package com.poly.Controller.user;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.poly.DAO.DiscountsDAO;
import com.poly.DAO.ProductsDAO;
import com.poly.Entities.Products;
import com.poly.service.CartItem;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {
	@Autowired
	ProductsDAO productRepo;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	@Autowired
	DiscountsDAO discountRepo;
	@GetMapping("/user/shop")
	public String view(Model model) {		
		/// lấy tổng sản phẩm hiện thi
		List<Products> listproduts = this.productRepo.findAll();
		System.out.println(listproduts);
		model.addAttribute("listproduts", listproduts);
		///lấy cái giảm giá hiện thị trên trang.
	//	Discounts discuont = this.discountRepo.getById(null);
		return "user/shop";
	}
	
	// luu thong tin san phawm tren shop nha
	// và kiểm tra xem cái sản phẩm có tăng hay ko và sử lí chô tăng luôn
		@SuppressWarnings("unchecked")
		@PostMapping(value = "/shop/user/addCart")
		public String addToCartShop(@RequestBody CartItem test) {
			System.out.println("dữ liệu truyền qua" + test.toString());
			System.out.println("Cái số lượng sau khi tăng lên: " +test.getQuantity());
			// bắt try lỗi khi click sản phẩm đầu tiên
			try {
				int id = test.getId();
				
				Products product = this.productRepo.findById(id);
				System.out.println(product.getTitles());
				String name = product.getTitles();
				int quantity = 1;
				float price = product.getPrice();
				String images =  product.getImages();
				float orderMoney = 0;
				if(test.getQuantity() > 0) {
					 orderMoney =  product.getPrice()*test.getQuantity();
					 System.out.println("Giá hiện tại khi tăng sản phẩm trên shop: " + orderMoney);
				}else {
					 orderMoney =  product.getPrice()*quantity;
					 System.out.println("Giá hiện tại khi tăng sản phẩm trên shop22222222: " + orderMoney);
				}								
				/*
				 * System.out.println(id); System.out.println(name); System.out.println(price);
				 * System.out.println(quantity); System.out.println(images);
				 * System.out.println(orderMoney);
				 */
				CartItem item = new CartItem(id, name, quantity, price,images,orderMoney);
				Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
				if (cart == null) {
					cart = new HashMap<Integer, CartItem>();
				}

				if (cart.containsKey(id)) {
					CartItem existingItem = cart.get(id);
					existingItem.setQuantity(existingItem.getQuantity() + quantity);
					System.out.println("giữ liệu tăng lên :::::: " + cart.get(id).getQuantity());
				} else {
					cart.put(id, item);
				}

				session.setAttribute("cart", cart);
				float total = 0;
				for (Entry<Integer, CartItem> entry : cart.entrySet()) {
					total += entry.getValue().getQuantity() * entry.getValue().getPrice();
				}

				session.setAttribute("total", total);
				System.out.println("Tông tiền: " + total);

			} catch (Exception e) {
				System.out.println("Lỗi truy vấn sản phẩm");
			}
			// sử lí lại
			return "/user/cart";
		}
		
		/// trừ đi số lượng có trong sản phẩm 
		// luu thong tin san phawm tren shop nha
		// và kiểm tra xem cái sản phẩm có tăng hay ko và sử lí chô tăng luôn
			@SuppressWarnings("unchecked")
			@PostMapping(value = "/shop/user/disCart")
			public String disCartShop(@RequestBody CartItem test) {
				System.out.println("dữ liệu truyền qua" + test.toString());
				System.out.println("Cái số lượng sau khi tăng lên: " +test.getQuantity());
				// bắt try lỗi khi click sản phẩm đầu tiên
				try {
					int id = test.getId();
					
					Products product = this.productRepo.findById(id);
					System.out.println(product.getTitles());
					String name = product.getTitles();
					int quantity = 1;
					float price = product.getPrice();
					String images =  product.getImages();
					float orderMoney = 0;
					if(test.getQuantity() > 0) {
						 orderMoney =  product.getPrice()*test.getQuantity();
						 System.out.println("Giá hiện tại khi tăng sản phẩm trên shop: " + orderMoney);
					}else {
						 orderMoney =  product.getPrice()*quantity;
						 System.out.println("Giá hiện tại khi tăng sản phẩm trên shop22222222: " + orderMoney);
					}								
					/*
					 * System.out.println(id); System.out.println(name); System.out.println(price);
					 * System.out.println(quantity); System.out.println(images);
					 * System.out.println(orderMoney);
					 */
					CartItem item = new CartItem(id, name, quantity, price,images,orderMoney);
					Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
					if (cart == null) {
						cart = new HashMap<Integer, CartItem>();
					}

					if (cart.containsKey(id)) {
						CartItem existingItem = cart.get(id);
						existingItem.setQuantity(existingItem.getQuantity() - quantity);
						System.out.println("giữ liệu tăng lên :::::: " + cart.get(id).getQuantity());
					} else {
						cart.put(id, item);
					}

					session.setAttribute("cart", cart);
					float total = 0;
					for (Entry<Integer, CartItem> entry : cart.entrySet()) {
						total += entry.getValue().getQuantity() * entry.getValue().getPrice();
					}

					session.setAttribute("total", total);
					System.out.println("Tông tiền: " + total);

				} catch (Exception e) {
					System.out.println("Lỗi truy vấn sản phẩm");
				}
				// sử lí lại
				return "/user/cart";
			}
			
		

}
