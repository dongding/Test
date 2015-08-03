package com.BiShe.bean;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SimpleMailSender  { 

	public boolean sendTextMail(MailSenderInfo mailInfo) { 
	
	  MyAuthenticator authenticator = null; 
	  Properties pro = mailInfo.getProperties();
	  if (mailInfo.isValidate()) { 
	  
		authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword()); 
	  }
	 
	  Session sendMailSession = Session.getDefaultInstance(pro,authenticator); 
	  try { 
	 
	  Message mailMessage = new MimeMessage(sendMailSession); 
	  
	  String k1="@perficientgdc.com.cn";
	  k1=mailInfo.getFromAddress()+k1;
	  Address b2=new InternetAddress(k1);
	 
	  mailMessage.setFrom(b2); 

	  String k="@perficientgdc.com.cn";
	  k=mailInfo.getToAddress()+k;
	  Address b1=new InternetAddress(k);
	  mailMessage.setRecipient(Message.RecipientType.TO,b1); 
	
	  List<Address> list1=new ArrayList<Address>(); 
	   String [] add=mailInfo.getCc().split(";");
	    String m="@perficientgdc.com.cn";
	    Address b = null;
	    for(String s:add){
	    	s+=m;
	    	try {
				b = new InternetAddress(s);
			} catch (AddressException e) {
				e.printStackTrace();
			}
	    	list1.add(b);
	    }
	    Address[] adds= new Address[list1.size()];
	    list1.toArray(adds);
	  mailMessage.setRecipients(Message.RecipientType.CC,adds);
	 
	  mailMessage.setSubject(mailInfo.getSubject()); 
	
	  mailMessage.setSentDate(new Date()); 
	
	  String mailContent = mailInfo.getContent(); 
	  mailMessage.setText(mailContent); 
	  
	  Transport.send(mailMessage);
	  return true; 
	  } catch (MessagingException ex) { 
		  ex.printStackTrace(); 
	  } 
	  return false; 
	} 
	
	public static boolean sendHtmlMail(MailSenderInfo mailInfo){ 

	  MyAuthenticator authenticator = null;
	  Properties pro = mailInfo.getProperties();
	
	  if (mailInfo.isValidate()) { 
		authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());
	  } 
	  
	  Session sendMailSession = Session.getDefaultInstance(pro,authenticator); 
	  try { 
	  
	  Message mailMessage = new MimeMessage(sendMailSession); 
	  
	  Address from = new InternetAddress(mailInfo.getFromAddress()); 
	  
	  mailMessage.setFrom(from); 
	
	 String k="@perficientgdc.com.cn";
	  k=mailInfo.getToAddress()+k;
	Address b1=new InternetAddress(k);
	  mailMessage.setRecipient(Message.RecipientType.TO,b1); 
	 
	  mailMessage.setSubject(mailInfo.getSubject()); 
	  
	  List<Address> list1=new ArrayList<Address>(); 
	   String [] add=mailInfo.getCc().split(";");
	    String m="@perficientgdc.com.cn";
	    Address b = null;
	    for(String s:add){
	    	s+=m;
	    	try {
				b = new InternetAddress(s);
			} catch (AddressException e) {
				e.printStackTrace();
			}
	    	list1.add(b);
	    }
	    Address[] adds= new Address[list1.size()];
	    list1.toArray(adds);
	  mailMessage.setRecipients(Message.RecipientType.CC, adds);
	  
	  mailMessage.setSentDate(new Date()); 
	 
	  Multipart mainPart = new MimeMultipart(); 
	
	  BodyPart html = new MimeBodyPart(); 
	  
	  html.setContent(mailInfo.getContent(), "text/html; charset=utf-8"); 
	  mainPart.addBodyPart(html); 
	 
	  mailMessage.setContent(mainPart); 
	   
	  Transport.send(mailMessage); 
	  return true; 
	  } catch (MessagingException ex) { 
		  ex.printStackTrace(); 
	  } 
	  return false; 
	} 
} 

