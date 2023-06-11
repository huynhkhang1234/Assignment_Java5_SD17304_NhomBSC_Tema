package com.poly.Beans;

import jakarta.validation.constraints.NotBlank;


public class FeedBack_bean {
	private int id;
	@NotBlank(message = "Vui lòng nhập thông tin tiêu đề")
	private String title;
	
	@NotBlank(message = "Vui lòng nhập thông tin nội dung")
	private String content;
	
	private int rating;

}
