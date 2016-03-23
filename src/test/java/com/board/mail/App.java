package com.board.mail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//import com.board.mail.*;

public class App {
    public static void main( String[] args )
    {
    	ApplicationContext context = 
             new ClassPathXmlApplicationContext("Spring-Mail.xml");
    	 
    	SendEmailUsingGMailSMTP mm = (SendEmailUsingGMailSMTP) context.getBean("SendEmailUsingGMailSMTP");
        mm.sendMail("support.auth@dimp.com",	// gmail의 내 계정에서 날아간다.
    		   "cooljohn72@gmail.com",
    		   "Testing123", 
    		   "<html><body><a href='#'>HTML</a>메일입니당....</body></html>");
        System.out.println("sending succeeded!!");
        
//    	SendEmailUsingGMailSMTP mm = (SendEmailUsingGMailSMTP) context.getBean("SendEmailUsingGMailSMTP");    	
//    	String userEmail = "cooljohn72@gmail.com";
//    	User user = new User();
//    	
//    	user.seteMail(userEmail);
//    	mm.register(user);
    }
}
