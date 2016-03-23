package com.board.mail;

// test1
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.*;
///. test1

//import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
//import org.springframework.ui.velocity.VelocityEngineUtils;








import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.board.beans.User;


public class SendEmailUsingGMailSMTP {
//	
//	private JavaMailSender mailSender;
//    private VelocityEngine velocityEngine;
//
//    public void setMailSender(JavaMailSender mailSender) {
//        this.mailSender = mailSender;
//    }
//
//    public void setVelocityEngine(VelocityEngine velocityEngine) {    	
//        this.velocityEngine = velocityEngine;
//    }
//
//    public void register(User user) {
//
//        // Do the registration logic...
//
//        sendConfirmationEmail(user);
//    }
//
//    private void sendConfirmationEmail(final User user) {
//        MimeMessagePreparator preparator = new MimeMessagePreparator() {
//            public void prepare(MimeMessage mimeMessage) throws Exception {
//                MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
//                message.setTo(user.geteMail());
//                message.setFrom("dimp.no-reply@gmail.com"); // could be parameterized...
//                Map model = new HashMap();
//                model.put("user", user);
//                String text = VelocityEngineUtils.mergeTemplateIntoString(
//                        velocityEngine, "emailForm_test.vm", "UTF-8", model);
//                message.setText(text, true);
//            }
//        };
//        this.mailSender.send(preparator);
//    }   

	
	private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(String from, String to, String subject, String content) {
		
		// 정보를 담기 위한 객체
		Properties p = new Properties();

		// SMTP 서버의 계정 설정
		// Naver와 연결할 경우 네이버 아이디 지정
		// Google과 연결할 경우 본인의 Gmail 주소
		p.put("mail.smtp.user", "cooljohn72@gmail.com");

		// SMTP 서버 정보 설정
		// 네이버일 경우 smtp.naver.com
		// Google일 경우 smtp.gmail.com
		p.put("mail.smtp.host", "smtp.gmail.com");
		    
		// 아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");		
//		
//		
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setFrom(from);
//		message.setTo(to);
//		message.setSubject(subject);
//		message.setText(msg);
//		mailSender.send(message);
		
		try {
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getInstance(p, auth);

		    // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
		    ses.setDebug(true);
		        
		    // 메일의 내용을 담기 위한 객체
		    MimeMessage msg = new MimeMessage(ses);

		    // 제목 설정
		    msg.setSubject(subject);
		        
		    // 보내는 사람의 메일주소
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr);
		        
		    // 받는 사람의 메일주소
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		        
		    // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
		    msg.setContent(content, "text/html;charset=UTF-8");
		        
		    // 발송하기
		    Transport.send(msg);
		        
		} catch (Exception mex) {
		    mex.printStackTrace();
		    String script = "메일발송에 실패했습니다.";
		    
		    System.out.print(script);
		    return;
		}
		    
		String script = "메일발송에 success했습니다.";
//		script += "alert('메일발송에 성공했습니다.');\n";
//		script += "</script>";
//		script += "<meta http-equiv='refresh' content='0; url=MailForm.html' />";
		System.out.print(script);

	}
}
