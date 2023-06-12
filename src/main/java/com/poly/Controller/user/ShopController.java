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
import com.poly.DAO.LikesDAO;
import com.poly.DAO.ProductsDAO;
import com.poly.DAO.UsersDAO;
import com.poly.Entities.Likes;
import com.poly.Entities.Products;
import com.poly.Entities.Users;
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
	
	@Autowired
	LikesDAO likesDAO;

	@GetMapping("/user/shop")
	public String view(Model model) {
		/// lấy tổng sản phẩm hiện thi
		List<Products> listproduts = this.productRepo.findAll();
	//	System.out.println(listproduts);
		model.addAttribute("listproduts", listproduts);
		
		Users u = (Users) session.getAttribute("userLogin");
		
		List<Likes> listLike = likesDAO.findAllByUserId(u.getId());
		
		
		model.addAttribute("listLike", listLike);
		/// lấy cái giảm giá hiện thị trên trang.
		// Discounts discuont = this.discountRepo.getById(null);
		return "user/shop";
	}

	// hiện thị thông tin sản phẩm khi click view
	@GetMapping("/shop/user/viewProduct")
	public String viewModel(Model model, @RequestBody CartItem test) {
		int id = test.getId();		
		Products listproduts = this.productRepo.findById(id);
		System.out.println("sản phẩm hiên thị lên view" + listproduts);
		model.addAttribute("viewProduct", listproduts);
		return "user/shop";
	}
	
	
	// luu thong tin san phawm tren shop nha và sản phẩm chi tiết.		
		@SuppressWarnings("unchecked")
		@PostMapping(value = "/shop/user/addCart")
		public String addToCartShop(@RequestBody CartItem test) {
			
			System.out.println("Cái số lượng sau khi tăng lên: " + test.getQuantity());
			// bắt try lỗi khi click sản phẩm đầu tiên
			try {
				
				int cartSize = 0;
				
				if(session.getAttribute("cartSize") != null) {
					 cartSize = (int) session.getAttribute("cartSize");
				}
				
				int id = test.getId();
				
				Products product = this.productRepo.findById(id);

				String name = product.getTitles();

				int quantity = 1;
				
				
				float giamGia =0; 
				try {
					giamGia=product.getPrice()*product.getDiscounts().getPrice_discounts() / 100;	
				} catch (Exception e) {
					giamGia = 0;
				}
													
				float price = product.getPrice() - giamGia;
				String images = product.getImages();
				float orderMoney = 0;
				
				  orderMoney =  price* 1;
				  System.out.println("số tiền sản phẩm khi click vào shop: orderMoney->> " + orderMoney);				 
				CartItem item = new CartItem(id, name, quantity, price, images, orderMoney);
				Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
				if (cart == null) {
					cart = new HashMap<Integer, CartItem>();
				}

				if (cart.containsKey(id)) {
					CartItem existingItem = cart.get(id);
					existingItem.setQuantity(existingItem.getQuantity() + 1);
					existingItem.setOrderMoney((product.getPrice()-giamGia) * existingItem.getQuantity());
					
				} else {
					
					cart.put(id, item);
					cartSize++;
				}
				
				float total = 0;
				for (Entry<Integer, CartItem> entry : cart.entrySet()) {
					total += entry.getValue().getQuantity() * entry.getValue().getPrice();
				}
				
				session.setAttribute("cartSize", cartSize);
				session.setAttribute("cart", cart);
				session.setAttribute("total", total);				
			} catch (Exception e) {
				System.out.println("Lỗi truy vấn sản phẩm");
			}
			return "/user/cart";
		}
					
}
