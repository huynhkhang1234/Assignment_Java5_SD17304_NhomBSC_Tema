package com.poly.Controller.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.DAO.Order_detailsDAO;
import com.poly.DAO.OrdersDAO;
import com.poly.Entities.Orders;
import com.poly.utils.XDate;

@Controller
@RequestMapping("/admin")
public class HomepageMANController {
	
	@Autowired
	OrdersDAO oDAO;
	
	@Autowired
	Order_detailsDAO odDAO;
	
	@GetMapping("/index")
	public String view(Model m) {
		
		List<Orders> listO = oDAO.findAll();
		
		m.addAttribute("listO", listO);
		
		String startDate = XDate.toString(new Date(), "yyyy-MM-dd");
		String endDate = XDate.toString(XDate.getDateAfter(10), "yyyy-MM-dd");
		
		m.addAttribute("startDate", startDate);
		m.addAttribute("endDate", endDate);
		return "admin/index";
	}
}
