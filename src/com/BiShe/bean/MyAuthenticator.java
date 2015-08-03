package com.BiShe.bean;

import javax.mail.*;
  
public class MyAuthenticator extends Authenticator{
	public String userName=null;
	public String password=null;
	 
	public MyAuthenticator(){
	}
	public MyAuthenticator(String username, String password) { 
		this.userName = username; 
		this.password = password; 
	} 
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication(userName, password);
	}
}
 
