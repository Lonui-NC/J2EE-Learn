<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*,java.util.*,javax.mail.*" %>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<%
	String result;
	//收件人的电子邮件
	String to="14210720152@fudan.edu.cn";
	//发件人邮件
	String from="congpang1201@163.com";
	//本地主机发送
	String host="localhost";
	//获取系统属性
	Properties properties=System.getProperties();
	//设置邮件服务器
	properties.setProperty("mail.smtp.host",host);
	
	//获取默认的session对象
	Session mailSession=Session.getDefaultInstance(properties);
	try{
		//创建一个默认的mimeMessage对象
		MimeMessage message=new MimeMessage(mailSession);
		//设置From的头部Header
		message.setFrom(new InternetAddress(from));
		//设置To 的header
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		//设置Subject:header
		message.setSubject("This is the subject line!");
		//设置实际消息
		message.setText("This is actual message");
		//发送消息
		Transport.send(message);
		result="sent message successfully！";
		
	}catch(MessagingException mex){
		mex.printStackTrace();
		result="Error";
	}
	
	

%>




















<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<% 
   out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>