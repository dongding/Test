package com.BiShe.bean;
/** 
* basic information
*/ 

import java.util.Properties; 

public class MailSenderInfo { 
	// Send email IP and port
	private String mailServerHost; 
	private String mailServerPort = "25"; 
	// sender email 
	private String fromAddress; 
	// recieve email
	private String toAddress; 
	// cc
	private String cc;
	//user and password 
	private String userName; 
	private String password; 
	// identify
	private boolean validate = false; 
	// email subject
	private String subject; 
	// email content
	private String content; 
	// email file name 
	private String[] attachFileNames; 	
	/** 
	  * email session
	  */ 
	public Properties getProperties(){ 
	  Properties p = new Properties(); 
	  p.put("mail.smtp.host", this.mailServerHost); 
	  p.put("mail.smtp.port", this.mailServerPort); 
	  p.put("mail.smtp.auth", validate ? "true" : "false"); 
	  return p; 
	} 
	public String getMailServerHost() { 
	  return mailServerHost; 
	} 
	public void setMailServerHost(String mailServerHost) { 
	  this.mailServerHost = mailServerHost; 
	}
	public String getMailServerPort() { 
	  return mailServerPort; 
	}
	public void setMailServerPort(String mailServerPort) { 
	  this.mailServerPort = mailServerPort; 
	}
	public boolean isValidate() { 
	  return validate; 
	}
	public void setValidate(boolean validate) { 
	  this.validate = validate; 
	}
	public String[] getAttachFileNames() { 
	  return attachFileNames; 
	}
	public void setAttachFileNames(String[] fileNames) { 
	  this.attachFileNames = fileNames; 
	}
	public String getFromAddress() { 
	  return fromAddress; 
	} 
	public void setFromAddress(String fromAddress) { 
	  this.fromAddress = fromAddress; 
	}
	public String getPassword() { 
	  return password; 
	}
	public void setPassword(String password) { 
	  this.password = password; 
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) { 
	  this.toAddress = toAddress; 
	} 
	public String getUserName() { 
	  return userName; 
	}
	public void setUserName(String userName) { 
	  this.userName = userName; 
	}
	public String getSubject() { 
	  return subject; 
	}
	public void setSubject(String subject) { 
	  this.subject = subject; 
	}
	public String getContent() { 
	  return content; 
	}
	public void setContent(String textContent) { 
	  this.content = textContent; 
	} 
} 