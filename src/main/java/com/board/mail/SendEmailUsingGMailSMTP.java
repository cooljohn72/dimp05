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
		
		// ������ ��� ���� ��ü
		Properties p = new Properties();

		// SMTP ������ ���� ����
		// Naver�� ������ ��� ���̹� ���̵� ����
		// Google�� ������ ��� ������ Gmail �ּ�
		p.put("mail.smtp.user", "cooljohn72@gmail.com");

		// SMTP ���� ���� ����
		// ���̹��� ��� smtp.naver.com
		// Google�� ��� smtp.gmail.com
		p.put("mail.smtp.host", "smtp.gmail.com");
		    
		// �Ʒ� ������ ���̹��� ������ �����ϹǷ� �������� ������.
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

		    // ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.
		    ses.setDebug(true);
		        
		    // ������ ������ ��� ���� ��ü
		    MimeMessage msg = new MimeMessage(ses);

		    // ���� ����
		    msg.setSubject(subject);
		        
		    // ������ ����� �����ּ�
		    Address fromAddr = new InternetAddress(from);
		    msg.setFrom(fromAddr);
		        
		    // �޴� ����� �����ּ�
		    Address toAddr = new InternetAddress(to);
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		        
		    // �޽��� ������ ����� ����, ĳ���� �� ����
		    msg.setContent(content, "text/html;charset=UTF-8");
		        
		    // �߼��ϱ�
		    Transport.send(msg);
		        
		} catch (Exception mex) {
		    mex.printStackTrace();
		    String script = "���Ϲ߼ۿ� �����߽��ϴ�.";
		    
		    System.out.print(script);
		    return;
		}
		    
		String script = "���Ϲ߼ۿ� success�߽��ϴ�.";
//		script += "alert('���Ϲ߼ۿ� �����߽��ϴ�.');\n";
//		script += "</script>";
//		script += "<meta http-equiv='refresh' content='0; url=MailForm.html' />";
		System.out.print(script);

	}
}
