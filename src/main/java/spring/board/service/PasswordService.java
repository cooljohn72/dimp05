package spring.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.context.ApplicationContext;

import com.spring.web.dao.SpringDao;

@Component
public class PasswordService {
	
	@Autowired
	private SpringDao dao;	
	
	public String showForgotPasswordForm(){
		return "emailForm_forgotPassword";
	}	
	
	public Boolean isExistingEmail(String emailAddress) throws Exception{
		
		Boolean result = false;
//		System.out.println("dao is null?; " + (dao.equals(null)));
		int userIdx = 0;
//		dao에서 NPE 발생..
		userIdx = dao.getUserByEmail(emailAddress);
		System.out.println("userIdx: "+ userIdx);
		if (userIdx>0)
			result = true;
		return result;
	}
	
}
