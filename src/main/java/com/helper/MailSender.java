package com.helper;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {

	public static void sendMail(String subject,String name,String from,String msg) {
		String to = "dattebaayo234@gmail.com";
		Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", "smtp.gmail.com");
	      props.put("mail.smtp.port", "587");
		
	      Session session = Session.getDefaultInstance(props, new Authenticator() {
	          protected PasswordAuthentication getPasswordAuthentication() {
	             return new PasswordAuthentication("itzshippu", "ckczqojeeakjkaoy");
	          }
	       });
	      System.out.println(session);
	      try {
	          MimeMessage message = new MimeMessage(session);
	          message.setFrom(new InternetAddress("info@dattebaayo.com"));
	          message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	          message.setSubject(subject);
	          message.setText("From :"+name+" Customer Email :"+from+" Message: "+msg);
	          Transport.send(message);
	          System.out.println("Email sent successfully.");
	       } catch (MessagingException mex) {
	          mex.printStackTrace();
	       }
	}
	
}
