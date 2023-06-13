package com.poly.Controller.user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.DAO.UsersDAO;
import com.poly.Entities.MailModel;
import com.poly.Entities.Users;
import com.poly.utils.MailerService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SendMail {
	@Autowired
	HttpServletRequest req;
	@Autowired
	JavaMailSender sender;
	@Autowired
	MailerService mailer;
	
	@Autowired
	UsersDAO uDAO;

	@Autowired
	ServletContext context;

	@GetMapping("/mail/send")
	public void index(Model m) {
		System.out.println("sendMailController.Index() -> " + req.getRequestURI());
		MailModel mail = new MailModel();
		m.addAttribute("mailModel", mail);
	}

	@PostMapping("/mail/send")
	public String send(Model m, @ModelAttribute("mailModel") MailModel mail
//			,@RequestParam("attachment") MultipartFile[] attach
			) throws IOException {
		
		MimeMessage message = sender.createMimeMessage();
		
		Users u = uDAO.findByEmail(mail.getTo());
		
		if(u != null) {
		
		
		mail.setFrom("PhinvhPC04124@fpt.edu.vn");
		mail.setBody("Username của bạn là: " + u.getUser_names() + "   Password của bạn là: " + u.getPass_words());
		try {

			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(mail.getFrom());
			helper.setSubject("Lấy lại mật khẩu");
			helper.setTo(mail.getTo());
			helper.setText(mail.getBody(), true);
			
			helper.setReplyTo(mail.getFrom());
			for (String email : mail.getCc()) {
				helper.addCc(email);
			}
			for (String email : mail.getBcc()) {
				helper.addCc(email);
			}
			for (File file : mail.getFiles()) {
				helper.addAttachment(file.getName(), file);
			}
		} catch (MessagingException | IllegalStateException ex) {
			ex.printStackTrace();
			m.addAttribute("message", "Gửi mail thất bại");
		}
		sender.send(message);
		
		System.out.println("Thành công");
		} else {
			System.out.println("Lỗi mail");
			m.addAttribute("message", "Gửi mail thất bại thành công");	
		}
		m.addAttribute("message", "Gửi mail thành công");	
		return "redirect:/mail/send";
	}


}
