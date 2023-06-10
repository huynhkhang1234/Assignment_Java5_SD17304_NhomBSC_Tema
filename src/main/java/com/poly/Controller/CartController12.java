//package com.poly.Controller;
//
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Map.Entry;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.poly.DAO.Order_detailsDAO;
//import com.poly.DAO.OrdersDAO;
//import com.poly.DAO.ProductsDAO;
//import com.poly.Entities.Order_details;
//import com.poly.Entities.Orders;
//import com.poly.Entities.Products;
//import com.poly.Entities.Users;
//import com.poly.service.CartItem;
//import com.poly.utils.XDate;
//
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
//
//@Controller
//public class CartController12 {
//	@Autowired
//	private HttpServletRequest request;
//	@Autowired
//	private HttpSession session;
//
//	@Autowired
//	private ProductsDAO productRepo;
//
//	@Autowired
//	private OrdersDAO orderRepo;
//
//	@Autowired
//	private Order_detailsDAO orderDetailRepo;
//
//	@GetMapping("/addCart")
//	public String showCart() {
//
//		try {
//			HttpSession session = request.getSession();
//			System.out.println(session.getAttribute("cart") + "giỏ hàng đầu vô");
//		} catch (Exception e) {
//			System.out.println("session giỏ hàng null");
//		}
//		return "user/buy_products";
//	}
//
//	@SuppressWarnings("unchecked")
//	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
//	public String addToCart() {
//		// bắt try lỗi khi click sản phẩm đầu tiên
//		try {
//			int id = Integer.parseInt(request.getParameter("id"));
//			String name = request.getParameter("name");
//			int quantity = Integer.parseInt(request.getParameter("quantity"));
//			double price = Double.parseDouble(request.getParameter("price"));
//			System.out.println(id);
//			System.out.println(name);
//			System.out.println(price);
//			System.out.println(quantity);
//			CartItem item = new CartItem(id, name, quantity, price);
//			Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
//			if (cart == null) {
//				cart = new HashMap<Integer, CartItem>();
//			}
//			if (cart.containsKey(id)) {
//				CartItem existingItem = cart.get(id);
//				existingItem.setQuantity(existingItem.getQuantity() + quantity);
//			} else {
//				cart.put(id, item);
//			}
//			session.setAttribute("cart", cart);
//			float total = 0;
//			for (Entry<Integer, CartItem> entry : cart.entrySet()) {
//				total += entry.getValue().getQuantity() * entry.getValue().getPrice();
//			}
//			session.setAttribute("total", total);
//			System.out.println("Tông tiền: " + total);
//		} catch (Exception e) {
//			System.out.println("Lỗi truy vấn sản phẩm");
//		}
//		// return "redirect:/home";
//		return "redirect:user/cart";
//	}
//
//	// nhấn nút lưu tren kia mua sản phẩm
//	@RequestMapping(value = "/saveCart", method = RequestMethod.POST)
//	public String saveCart() {
//		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart"); // Thực hiện lưu thông
//		// test thử dữ liệu khi thêm sản phẩm vào
//		try {
//			System.out.println("gio hang database : " + cart.get(1).getName());
//			System.out.println("gio hang database : " + cart.get(2).getName());
//		} catch (Exception e) {
//			System.out.println("lưu 1 giỏ hàng");
//		}
//		// tạo đối tượng
//		Orders order = new Orders();
//		// int start = cart.get(0).getId();
//		// System.out.println(start+ "start");
//
//		// duyệt vong for lấy ra đối tượng
//		// for (int i = 1; i <= cart.size(); i++) {
//		System.out.println("kích thước của tất cả sản phẩm :" + cart.size());
//		// dùng vong lập duyệt qua giá trị của key và value có trong map
//		for (Entry<Integer, CartItem> entry : cart.entrySet()) {
//			// lấy key
//			Integer key = entry.getKey();
//			Products ps = this.productRepo.findById(cart.get(key).getId());
//			order.setNotes("ghi chú");
//			order.setStatus("Đang vẩn chuyển");
//			// lấy gái trị session và gán vào giá trị
//			Float sumMoney = (Float) session.getAttribute("total");
//			order.setSum_money(sumMoney);
//			// set đối tượng user vào session
//			Users userLogin = (Users) session.getAttribute("userLogin");
//			order.setUsers(userLogin);
//			// số tiền nhận từ thanh toán // xem lại mua on hay off
//			order.setMoney_received(0);
//			order.setCreate_date(XDate.now());
//			// lưu vao database
//			this.orderRepo.save(order);
//			// tìm kiếm userid để set vào ,...
//			Orders orid = this.orderRepo.findByUserID(userLogin.getId());
//			// lưu vào order detail
//			Order_details orderd = new Order_details();
//			orderd.setOrders(orid);
//			System.out.println(orid.getId());
//			orderd.setProducts(ps);
//			orderd.setPrice((int) entry.getValue().getPrice());
//			orderd.setQuanlity(entry.getValue().getQuantity());
//			orderd.setSum_money((float) (entry.getValue().getPrice() * entry.getValue().getId()));
//			orderd.setCreate_date(XDate.now());
//			this.orderDetailRepo.save(orderd);
//		}
//
//		session.removeAttribute("cart");
//		session.removeAttribute("total");
//		return "user/cart";
//	}
//
//	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
//	public String delete(@ModelAttribute("id") int id) {
//		System.out.println("tess");
//		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart"); // Thực hiện lưu thông
//		// Xóa sản phẩm có khóa (key) là 2
//		cart.remove(id);
//		System.out.println("xóa giỏ hàng thành công");
//		System.out.println(cart.size() + "số lượng sản phẩm");
//		// Cập nhật lại danh sách sản phẩm trong session
//		session.setAttribute("cart", cart);
//		return "redirect:user/cart";
//	}
//
//	// suwr li ajax.
////	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
////	<script>
////	   function addToCart() {
////	       var id = $("#productId").val();
////	       var name = $("#productName").val();
////	       var quantity = $("#quantity").val();
////	       var price = $("#price").val();
////	       $.ajax({
////	           type: "POST",
////	           url: "/addCart",
////	           data: {
////	               id: id,
////	               name: name,
////	               quantity: quantity,
////	               price: price
////	           },
////	           success: function(data) {
////	               alert("Thêm vào giỏ hàng thành công");
////	           },
////	           error: function(data) {
////	               alert("Có lỗi xảy ra");
////	           }
////	       });
////	   }
////	   // luu data
////	   function saveCart() {
////	       $.ajax({
////	           type: "POST",
////	           url: "/saveCart",
////	           success: function(data) {
////	               alert("Lưu giỏ hàng thành công");
////	           },
////	           error: function(data) {
////	               alert("Có lỗi xảy ra");
////	           }
////	       });
////	   }
////	</script>
//
//	///
//
//}
