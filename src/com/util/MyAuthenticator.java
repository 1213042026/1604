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
	         //�������Ҫ�������ʼ�   
	      MailSenderInfo mailInfo = new MailSenderInfo();    
	      mailInfo.setMailServerHost("smtp.163.com");    
	      mailInfo.setMailServerPort("25");    
	      mailInfo.setValidate(true);    
	      mailInfo.setUserName("mnmnmn369963@163.com");    
	      mailInfo.setPassword("15963531418");//������������    
	      mailInfo.setFromAddress("mnmnmn369963@163.com");    
	      mailInfo.setToAddress("mnmnmn369963@163.com");    
	      mailInfo.setSubject("test");    
	      mailInfo.setContent("123");    
	         //�������Ҫ�������ʼ�   
	      SimpleMailSender sms = new SimpleMailSender();   
	          sms.sendTextMail(mailInfo);//���������ʽ    
	          sms.sendHtmlMail(mailInfo);//����html��ʽ   
	    }  


}
