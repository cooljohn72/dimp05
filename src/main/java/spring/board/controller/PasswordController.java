package spring.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.board.service.PasswordService;

import com.board.beans.*;
import com.spring.web.dao.SpringDao;

@Controller
@RequestMapping("/password")
public class PasswordController {
	
	private final PasswordService passwordService;

	@Autowired
	private SpringDao dao;
	
	@Autowired	
	public PasswordController(PasswordService passwordService){
		this.passwordService = passwordService;
	}
	
//	1. request email address submit form	
	@RequestMapping(value="/forgot", method=RequestMethod.GET)
	public String showEmailAddressForm() throws Exception{
		return passwordService.showForgotPasswordForm();
//		return "emailForm_forgotPassword";
	}
	
//	2. submit email address and issues security code if available email address
	@RequestMapping(value="/forgot", method=RequestMethod.POST)
	public String validateEmailAddress(
			HttpServletRequest request) throws Exception{
//		if valid email address, show button to send validating email
		String emailAddressSubmitted = request.getParameter("email");		
		if(passwordService.isExistingEmail(emailAddressSubmitted)){
			
		}else{
			
		}
//		int userIdx = dao.getUserByEmail(emailAddressSubmitted);
//		System.out.println("userIdx: "+ userIdx);
//		if not, show no email address message;
		return null;
	}
	
	@RequestMapping(value="/forgot/emailMe", method=RequestMethod.POST)
	public String requestValidationEmail() throws Exception{
//		send email to the registered address
		return null;
	}
	
	@RequestMapping(value="/forgot/?c={securityCode}", method=RequestMethod.GET)
	public String validateSecrityCode(
			@RequestParam(value="c", required=true) String securityCode,
			HttpServletRequest request) throws Exception{
//		check if the code is correct and show new password form
		return null;
	}
	@RequestMapping(value="/forgot/?c={securityCode}", method=RequestMethod.POST)
	public String updateNewPassword(
			@RequestParam(value="c", required=true) String securityCode,
			HttpServletRequest request) throws Exception{
		return null;
	}
	
//@RequestMapping(value="/resetpassword", method=RequestMethod.POST)
//public abstract String validateEmailAddress(
//		HttpServletRequest request) throws Exception;
////3. check the security code and show new password form if the code is correct
//@RequestMapping(value="/resetpassword/?c={securityCode}", method=RequestMethod.GET)
//public abstract String validateSecurityCode(
//		@RequestParam(value="c", required=true) String securityCode,
//		HttpServletRequest request) throws Exception;
////4. update the new password

//@RequestMapping(value="/scodetest/{str}")
//public abstract String testGetSecurityCode(
//		@PathVariable String str,
//		HttpServletRequest request) throws Exception;

}
