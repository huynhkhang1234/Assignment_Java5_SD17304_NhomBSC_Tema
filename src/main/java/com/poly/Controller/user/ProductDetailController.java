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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poly.DAO.GalleriesDAO;
import com.poly.DAO.ProductsDAO;
import com.poly.Entities.Galleries;
import com.poly.Entities.Products;
import com.poly.service.CartItem;
import com.poly.service.NumberFormatMoney;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductDetailController {

	@Autowired
	ProductsDAO productRepo;
	@Autowired
	HttpServletRequest request;

	@Autowired
	GalleriesDAO galleriesRepo;

	@Autowired
	HttpSession session;

	@GetMapping("/user/product{id}")
	public String view(Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		// tìm kiếm 1 sản phẩm
		Products ps = this.productRepo.findById(id);
		model.addAttribute("productDetail", ps);

		// tìm kiếm all sản phẩm thích bên dưới
		List<Products> listProductLike = this.productRepo.findAll();
		model.addAttribute("listProductLike", listProductLike);

		// chuyển đồi tiền tệ
		model.addAttribute("productDetailPrice", NumberFormatMoney.formatMoney(ps.getPrice()));
		System.out.println(ps.getTitles());
		System.out.println("trang hiện thị sản phẩm");

		// hiện thi slide show ảnh
		List<Galleries> galleriesList = this.galleriesRepo.findByImages(ps);
		model.addAttribute("galleriesList", galleriesList);
		System.out.println("slide show :" + galleriesList);
		return "user/detail";
	}
	/// ad dữ liệu vào
	@SuppressWarnings("unchecked")
	@PostMapping(value = "/user/addCart")
	public String addToCart(@RequestBody CartItem test) {
		System.out.println("dữ liệu truyền qua" + test.toString());
		// bắt try lỗi khi click sản phẩm đầu tiên
		try {
			int id = test.getId();
			String name = test.getName();
			int quantity = test.getQuantity();
			float price = (float) test.getPrice();
			String images = test.getImages();
			float orderMoney = (float) (test.getQuantity()*test.getPrice());
			System.out.println(id);
			System.out.println(name);
			System.out.println(price);
			System.out.println(quantity);
			System.out.println(images);
			System.out.println(orderMoney);
			CartItem item = new CartItem(id, name, quantity, price,images,orderMoney);
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
