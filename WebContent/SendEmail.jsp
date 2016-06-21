<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,javax.mail.*" %>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!-- 在tomcat下运行，记得把对应的资源包放入 -->

<%
	String result;
	//收件人的电子邮件
	String to="congpang1201@163.com";
	//发件人邮件
	String from="zhangcong_1201@sina.com";
	//本地主机发送
	String host="smtp.sina.com.cn";//设置对应邮件服务器
	String username="zhangcong_1201@sina.com";
	String password="**************";
	//获取系统属性
	Properties properties=System.getProperties();
	//设置邮件服务器
	properties.setProperty("mail.smtp.host",host);
	//用户认证部分
	properties.setProperty("mail.user", username);
	properties.setProperty("mail.password", password);
	//获取默认的session对象
	//根据网络所述，需要自己设定对应的
// 	Session mailSession = Session.getDefaultInstance(properties,
//     new Authenticator() {
//         protected PasswordAuthentication  getPasswordAuthentication() {
//         return new PasswordAuthentication(
//                     "myemail@gmail.com", "password");
//                 }
//     });
	
	Session mailSession=Session.getDefaultInstance(properties);
	try{
		//创建一个默认的mimeMessage对象
		MimeMessage message=new MimeMessage(mailSession);
		//设置From的头部Header
		message.setFrom(new InternetAddress(from));
		//设置To 的header
		//如果指定多个地址
		//在addRecipients里面加进去（Message.RecipientType type,Address[] addresses）
		
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		//设置Subject:header
		message.setSubject("This is the subject line!");
		//设置实际消息
		//message.setText("This is actual message");
		// 设置 HTML消息
	    //message.setContent("<h1>This is actual message</h1>",
	    //                       "text/html" );
		//发送消息
		
		//创建消息部分
		BodyPart messageBodyPart=new MimeBodyPart();
		//填充消息
		messageBodyPart.setText("This is message body!");
		//设置多媒体消息
		Multipart multipart=new MimeMultipart();
		//设置文本部分
		multipart.addBodyPart(messageBodyPart);
		
		//附件部分
		messageBodyPart=new MimeBodyPart();
		//设置数据源！！！
		String filename="D:\\web html\\123.txt";
		//据说可以直接有attachfile的方法
		DataSource source=new FileDataSource(filename);
		messageBodyPart.setDataHandler(new DataHandler(source));
		messageBodyPart.setFileName("123.txt");
		multipart.addBodyPart(messageBodyPart);
		
		//发送完整消息
		//将对应消息放进去
		message.setContent(multipart);
		
		
		//根据最新的来看，发送消息里面必须也要加user，password！
		Transport.send(message,username,password);
		result="sent message successfully ";
		
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