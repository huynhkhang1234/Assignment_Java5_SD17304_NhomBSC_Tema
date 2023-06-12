package com.poly.Controller.user;

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
public class CheckoutController {
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
	@GetMapping("/user/cart/checkout")
	public String view() {
		// giỏ hàng
		return "user/checkout";
	}
	
	// nhấn nút lưu tren kia mua sản phẩm
	@RequestMapping(value = "/user/saveCart/checkout", method = RequestMethod.POST)
	public String saveCart() {
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart"); // Thực hiện lưu thông
		// test thử dữ liệu khi thêm sản phẩm vào
		try {
			System.out.println("gio hang database : " + cart.get(1).getName());
			System.out.println("gio hang database : " + cart.get(2).getName());
		} catch (Exception e) {
			System.out.println("lưu 1 giỏ hàng");
		}
		// tạo đối tượng
		Orders order = new Orders();
		// int start = cart.get(0).getId();
		// System.out.println(start+ "start");

		// duyệt vong for lấy ra đối tượng
		// for (int i = 1; i <= cart.size(); i++) {
		System.out.println("kích thước của tất cả sản phẩm :" + cart.size());
		// dùng vong lập duyệt qua giá trị của key và value có trong map
		for (Entry<Integer, CartItem> entry : cart.entrySet()) {
			// lấy key
			Integer key = entry.getKey();
			Products ps = this.productRepo.findById(cart.get(key).getId());
			order.setNotes("ghi chú");
			order.setStatus("Đang vẩn chuyển");
			// lấy gái trị session và gán vào giá trị
			Float sumMoney = (Float) session.getAttribute("total");
			order.setSum_money(sumMoney);
			// set đối tượng user vào session
			Users userLogin = (Users) session.getAttribute("userLogin");
			order.setUsers(userLogin);
			// số tiền nhận từ thanh toán // xem lại mua on hay off			
			order.setMoney_received(sumMoney);
			order.setCreate_date(XDate.now());
			// lưu vao database
			this.orderRepo.save(order);
			// tìm kiếm userid để set vào ,...
			Orders orid = this.orderRepo.findByUserID(userLogin.getId());
			// lưu vào order detail
			Order_details orderd = new Order_details();
			orderd.setOrders(orid);
			System.out.println(orid.getId());
			orderd.setProducts(ps);
			orderd.setPrice((int) entry.getValue().getPrice());
			orderd.setQuanlity(entry.getValue().getQuantity());
			orderd.setSum_money((float) (entry.getValue().getPrice() * entry.getValue().getQuantity()));
			orderd.setCreate_date(XDate.now());
			this.orderDetailRepo.save(orderd);
		}

		session.removeAttribute("cart");
		session.removeAttribute("total");
		return "user/shop";
	}

	
}
