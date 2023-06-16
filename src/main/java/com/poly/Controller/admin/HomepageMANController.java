package com.poly.Controller.admin;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.DAO.Order_detailsDAO;
import com.poly.DAO.OrdersDAO;
import com.poly.Entities.Order_details;
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
	public String view(Model m, @RequestParam("p") Optional<Integer> p) {
		
		List<Orders> listO = (List<Orders>) m.asMap().get("listO");
		
	    if (listO == null) {
	        listO = oDAO.findAll();
	    }
	    

		float tongTienNhan = 0;
		float tongTienSP = 0;
		float tienLoi = 0;
		int soLuongDonHang = 0;
	    
	    for (Orders o : listO) {
	    	tongTienNhan += o.getMoney_received();
	    	for (Order_details od : o.getOrder_details()) {
				tongTienSP += od.getProducts().getOriginal_price() * od.getQuanlity();
			}
		}
	    
	    tienLoi = tongTienNhan - tongTienSP;
	    soLuongDonHang = listO.size() + 1;
	    

	    String startDate = XDate.toString(new Date(), "yyyy-MM-dd");
	    String endDate = XDate.toString(XDate.getDateAfter(10), "yyyy-MM-dd");
	    
	    Pageable pageable = PageRequest.of(p.orElse(0), 5);
		Page<Orders> page = oDAO.findAll(pageable);
		
		m.addAttribute("page", page);
	    m.addAttribute("listO", listO);
	    m.addAttribute("startDate", startDate);
	    m.addAttribute("endDate", endDate);
	    
	    m.addAttribute("soLuongDonHang", soLuongDonHang);
	    m.addAttribute("tienLoi", tienLoi);
	    m.addAttribute("tongTienSP", soLuongDonHang);
	    m.addAttribute("soLuongDonHang", tongTienNhan);

	    return "/admin/index";
	}
	
	@PostMapping("/index")
	public String submit(
			@RequestParam("startDate") String startDateTemp,
			@RequestParam("endDate") String endDateTemp,
			@RequestParam("p") Optional<Integer> p,
			Model m) {
		
		
		try {
			
			LocalDate date1 = LocalDate.parse(startDateTemp);
			LocalDate date2 = LocalDate.parse(endDateTemp);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			
			String a = date1.format(formatter);
			String b = date2.format(formatter);

			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			Date startDate = format.parse(a);
			Date endDate = format.parse(b);

			java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());
			java.sql.Date sqlEndDate = new java.sql.Date(endDate.getTime());

			
			// phương thức before sẽ kiểm tra ngày của tham số truyền vào có lớn hơn ngày bắt đầu hay không
			if (endDate.before(startDate)) {
				m.addAttribute("message", "Ngày kết thúc phải lớn ngày bắt đầu nhe bé!!!");
				
			} else {
				List<Orders> listO = oDAO.findByCreateDateBetween(sqlStartDate, sqlEndDate);
	            m.addAttribute("listO", listO);
	            
	            Pageable pageable = PageRequest.of(p.orElse(0), 5);
	    		Page<Orders> page = oDAO.findByCreateDateBetween(sqlStartDate, sqlEndDate, pageable);
	    		m.addAttribute("page", page);
			}
			
			 String startDate1 = XDate.toString(startDate, "yyyy-MM-dd");
		     String endDate1 = XDate.toString(endDate, "yyyy-MM-dd");
		     
		     m.addAttribute("startDate", startDate1);
		     m.addAttribute("endDate", endDate1);

		     return "/admin/index";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin/index";
		}
	}
}
