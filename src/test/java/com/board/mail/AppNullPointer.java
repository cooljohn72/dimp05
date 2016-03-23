package com.board.mail;

import org.springframework.context.ApplicationContext;

import com.spring.web.dao.SpringDao;

import spring.board.service.PasswordService;

public class AppNullPointer {

	public static void main(String args[]) throws Exception{
		
		PasswordService service = new PasswordService();
		SpringDao dao = new SpringDao();
		String email = "12121@h.com";
		Boolean result = false;
//		Boolean result = service.isExistingEmail(email, dao);
		System.out.println("result: "+result);
	}


}
