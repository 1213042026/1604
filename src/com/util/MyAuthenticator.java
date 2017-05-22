package com.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	 String userName=null;   
	    String password=null;   
	        
	    public MyAuthenticator(){   
	    }   
	    public MyAuthenticator(String username, String password) {    
	        this.userName = username;    
	        this.password = password;    
	    }    
	    protected PasswordAuthentication getPasswordAuthentication(){   
	        return new PasswordAuthentication(userName, password);   
	    }   
	    
	    public static void main(String[] args){   
	         //这个类主要是设置邮件   
	      MailSenderInfo mailInfo = new MailSenderInfo();    
	      mailInfo.setMailServerHost("smtp.163.com");    
	      mailInfo.setMailServerPort("25");    
	      mailInfo.setValidate(true);    
	      mailInfo.setUserName("mnmnmn369963@163.com");    
	      mailInfo.setPassword("15963531418");//您的邮箱密码    
	      mailInfo.setFromAddress("mnmnmn369963@163.com");    
	      mailInfo.setToAddress("mnmnmn369963@163.com");    
	      mailInfo.setSubject("test");    
	      mailInfo.setContent("123");    
	         //这个类主要来发送邮件   
	      SimpleMailSender sms = new SimpleMailSender();   
	          sms.sendTextMail(mailInfo);//发送文体格式    
	          sms.sendHtmlMail(mailInfo);//发送html格式   
	    }  


}
