package com.poly.Controller.user;

import java.util.HashMap;
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
public class CartController {
	@Autowired
	HttpSession session;
	@Autowired
	ProductsDAO productRepo;
	@Autowired
	HttpServletRequest request;

	@Autowired
	DiscountsDAO discountRepo;

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

	@GetMapping("/user/order")
	public String view2() {
		// giỏ hàng
		return "/admin/product";
	}

	@PostMapping("/delete/cart")
	public String delete(Model model, @RequestBody CartItem test) {
		int id = test.getId();
		System.out.println("Du lieu truyen qua: " + test.getId());

		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Integer, CartItem>();
		} else {

			float total = (float) session.getAttribute("total");
			int cartNumber = (int) session.getAttribute("cartSize");
			float price = (float) (total - (cart.get(id).getPrice() * cart.get(id).getQuantity()));
			cart.remove(id);
			cartNumber--;
			session.setAttribute("cartSize", cartNumber);
			session.setAttribute("cart", cart);
			session.setAttribute("total", price);
			System.out.println(session.getAttribute("total"));

		}

		return "user/cart";
	}

	// tăng sản phẩm lên
	@SuppressWarnings("unchecked")

	@PostMapping(value = "/user/addCart")
	public String addToCart(@RequestBody CartItem test) {
		// bắt try lỗi khi click sản phẩm đầu tiên
		try {
			int id = test.getId();
			String name = test.getName();
			int quantity = test.getQuantity();
			float price = (float) test.getPrice();
			
			
			String images = test.getImages();
			float orderMoney = (float) (test.getQuantity() * test.getPrice());
			
			CartItem item = new CartItem(id, name, quantity, price, images, orderMoney);
			Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
			if (cart == null) {
				cart = new HashMap<Integer, CartItem>();
			}
			// chắc chắn
			if (cart.containsKey(id)) {
				CartItem existingItem = cart.get(id);
				existingItem.setQuantity(existingItem.getQuantity() + 1);
				existingItem.setOrderMoney((float) (test.getPrice() *existingItem.getQuantity()));				
			} else {
				cart.put(id, item);
			}
	
			float total = 0;
			for (Entry<Integer, CartItem> entry : cart.entrySet()) {
				total += entry.getValue().getQuantity() * entry.getValue().getPrice();
			}
			session.setAttribute("cart", cart);
			session.setAttribute("total", total);
			System.out.println("Tông tiền: " + total);

		} catch (Exception e) {
			System.out.println("Lỗi truy vấn sản phẩm");
		}
		return "/user/cart";
	}

	//

	/// trừ đi số lượng có trong sản phẩm
	// luu thong tin san phawm tren shop nha
	// và kiểm tra xem cái sản phẩm có tăng hay ko và sử lí chô tăng luôn
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/shop/user/disCart")
	public String disCartShop(@RequestBody CartItem test) {
		
			try {
				int id = test.getId();
				String name = test.getName();
				int quantity = test.getQuantity();
				float price = (float) test.getPrice();
				
				
				String images = test.getImages();
				float orderMoney = (float) (test.getQuantity() * test.getPrice());
				
				CartItem item = new CartItem(id, name, quantity, price, images, orderMoney);
				Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
				if (cart == null) {
					cart = new HashMap<Integer, CartItem>();
				}
				// chắc chắn
				if (cart.containsKey(id)) {
					CartItem existingItem = cart.get(id);
					existingItem.setQuantity(existingItem.getQuantity() - 1);
					existingItem.setOrderMoney((float) (test.getPrice() *existingItem.getQuantity()));
					System.out.println("số lượng của sản phẩm đang tồn tại: " + existingItem.getQuantity());
					System.out.println("Giá của sản phẩm đang tồn tại: " + test.getPrice());
				} else {
					cart.put(id, item);
				}
		
				float total = 0;
				for (Entry<Integer, CartItem> entry : cart.entrySet()) {
					total += entry.getValue().getQuantity() * entry.getValue().getPrice();
				}
				session.setAttribute("cart", cart);
				session.setAttribute("total", total);
				System.out.println("Tông tiền: " + total);

			} catch (Exception e) {
				System.out.println("Lỗi truy vấn sản phẩm");
			}
		

		return "/user/cart";
	}
}
