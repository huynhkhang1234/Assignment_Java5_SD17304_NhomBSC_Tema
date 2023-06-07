package com.poly.Controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poly.DAO.Order_detailsDAO;
import com.poly.DAO.OrdersDAO;
import com.poly.DAO.ProductsDAO;
import com.poly.Entities.Order_details;
import com.poly.Entities.Orders;
import com.poly.Entities.Products;
import com.poly.Entities.Users;
import com.poly.service.CartItem;
import com.poly.utils.XDate;

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

	@Autowired
	private OrdersDAO orderRepo;

	@Autowired
	private Order_detailsDAO orderDetailRepo;

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
		//null giá trị
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		System.out.println(id);
		System.out.println(name);
		System.out.println(price);	
		System.out.println(quantity);
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

	// nhấn nút lưu tren kia database
	@RequestMapping(value = "/saveCart", method = RequestMethod.POST)
	public String saveCart() {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			double price = Double.parseDouble(request.getParameter("price"));
		} catch (Exception e) {
			System.out.println("tham so truyen vao null");
		}
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart"); // Thực hiện lưu thông
		// tin giỏ hàng vào cơ sở dữ liệu ở đây Products pro =
		try {
			System.out.println("gio hang database : " + cart.get(1).getName());
			System.out.println("gio hang database : " + cart.get(2).getName());
		} catch (Exception e) {
			System.out.println("lưu 1 giỏ hàng");
		}
		
		// tạo đối tượng
		Orders order = new Orders();
		//int start = cart.get(0).getId();		
		//System.out.println(start+ "start");
		
		// duyệt vong for lấy ra đối tượng
		for (int i = 1; i <= cart.size(); i++) {
			System.out.println(cart.size());
			// lấy giá trị của id
			for (Entry<Integer, CartItem> entry : cart.entrySet()) {
				
			    Integer key = entry.getKey();
				Products ps = this.productRepo.findById(cart.get(key).getId());
//			    CartItem value = entry.getValue().getPrice();
//			    System.out.println("Key: " + key + ", Value: " + value);
				order.setNotes("ghi chú");
				order.setStatus("Đang vẩn chuyển");
				order.setSum_money((float) 200000);
				// set đối tượng user vào trang
				HttpSession session = request.getSession();
				Users userLogin = (Users) session.getAttribute("userLogin");
				//String id = String.valueOf(userLogin.getId());
				//System.out.println(userLogin.getId());			
				//session.setAttribute("orderId", userLogin);
//				Integer intValue = userLogin.getId();
//				Order_details order2 = new Order_details();
			//	order2.setOrders(intValue.valueOf(intValue.toString()));
				order.setUsers(userLogin);
				order.setMoney_received(200000);
				order.setCreate_date(XDate.now());
				// lưu vao database
				this.orderRepo.save(order);
				Orders orid = this.orderRepo.findByUserID(userLogin.getId());
				System.out.println(orid);
				//lưu vào order detail			
				//HttpSession session1 = request.getSession();
				Order_details orderd = new Order_details();
			//	Orders orderId = (Orders) session.getAttribute("orderId");
				// set vào id			
			//	Orders orderId = this.orderRepo.findByID(1);
				orderd.setOrders(orid);
				System.out.println(orid.getId());
				orderd.setProducts(ps);
				orderd.setPrice(3000000);
				orderd.setQuanlity(2);
				orderd.setSum_money(6000000);
				orderd.setCreate_date(XDate.now());
				this.orderDetailRepo.save(orderd);
			}
			//
			
			
		}
		
//		System.err.println(pro);
		// session.removeAttribute("cart");
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
