<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Using JavaBeans in JSP</title>
</head>
<body>
<center>
<%@page import="java.util.*,java.io.*" %>
<h2>Using JavaBeans in JSP</h2>
 
<jsp:useBean id="test" class="com.j2ee.learn.TestBean" />
 
<jsp:setProperty name="test" 
                    property="message" 
                    value="Hello JSP..." />
 
<p>Got message....</p>

<jsp:getProperty name="test" property="message" />
 <%
   // 设置每隔5秒自动刷新
   response.setIntHeader("Refresh", 5);
   // 获取当前时间
   Calendar calendar = new GregorianCalendar();
   String am_pm;
   int hour = calendar.get(Calendar.HOUR);
   int minute = calendar.get(Calendar.MINUTE);
   int second = calendar.get(Calendar.SECOND);
   if(calendar.get(Calendar.AM_PM) == 0)
      am_pm = "AM";
   else
      am_pm = "PM";
   String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
   out.println("Current Time is: " + CT + "\n");
%>
<ul>
<li><p><b> First Name:</b>
<%= request.getParameter("first_name") %>
</p></li>
<li>
<p><b>Last Name:</b>
<%= request.getParameter("last_name") %>
</p>
</li>
</ul>
<%
//获取对象
	Enumeration paramNames=request.getParameterNames();
	while(paramNames.hasMoreElements()){
		String paramName=(String)paramNames.nextElement();
		out.println("paramName: "+paramName+"  ");
		String paramValue=request.getParameter(paramName);
		out.println("paramValue: "+paramValue+"  ");
		out.println("<br/>");
	}
%>
<% //session
	//jsp引擎隐含的将session暴露出来，故不用生成对象！
	//获取java Session
	Date createTime=new Date(session.getCreationTime());
	Date lastAccessTime=new Date(session.getLastAccessedTime());
	String title="Welcome Back";
	Integer visitCount=new Integer(0);
	String visitCountKey=new String("visitCount");
	String userIDKey=new String("userID");
	String userID=new String("ABCD");	
	//检查网页是否由新用户访问
	if(session.isNew())
	{
		title="welcome";
		session.setAttribute(userIDKey, userID);
		session.setAttribute(visitCountKey, visitCount);
		
	}
	visitCount=(Integer)session.getAttribute(visitCountKey);
	visitCount=visitCount+1;
	userID=(String)session.getAttribute(userIDKey);
	session.setAttribute(visitCountKey, visitCount);

%>

<center>
<h1>Session Tracking</h1>
</center>
<table border="1" align="center"> 
<tr bgcolor="#949494">
   <th>Session info</th>
   <th>Value</th>
</tr> 
<tr>
   <td>id</td>
   <td><% out.print( session.getId()); %></td>
</tr> 
<tr>
   <td>Creation Time</td>
   <td><% out.print(createTime); %></td>
</tr> 
<tr>
   <td>Time of Last Access</td>
   <td><% out.print(lastAccessTime); %></td>
</tr> 
<tr>
   <td>User ID</td>
   <td><% out.print(userID); %></td>
</tr> 
<tr>
   <td>Number of visits</td>
   <td><% out.print(visitCount); %></td>
</tr> 
</table> 

<% 
	Date date=new Date();
	out.print("<h2 align=\"center\">"+date.toString()+"</h2>");
	SimpleDateFormat ft=new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
	out.print("<h2 align=\"center\">"+ft.format(date)+"</h2>");
	
%>

<%@ page import="java.io.*,java.util.*" %>

<%
	//统计页面点击量
	Integer hitsCount=
			(Integer)application.getAttribute("hitCounter");
	if(hitsCount==null || hitsCount==0)
	{
		//第一次访问
		out.println("welcome");
		hitsCount=1;
		
	}
	else
	{
		out.println("welcome back");
		hitsCount+=1;
	}
	application.setAttribute("hitCounter", hitsCount);
%>
<p>Total number of visits: <%= hitsCount%></p>

 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:useBean id="date2" class="java.util.Date"></jsp:useBean>
<p>The date is <%= date2 %>

<jsp:useBean id="students" class="com.j2ee.learn.StudentBean">
	<jsp:setProperty name="students" property="firstName" 
					value="Zara"/>
	<jsp:setProperty name="students" property="lastName" 
                    value="Ali"/>
   <jsp:setProperty name="students" property="age" 
                    value="10"/>
</jsp:useBean>

<p>Students First Name:
	<jsp:getProperty property="firstName" name="students"/>
</p>
<p>Student Last Name: 
   <jsp:getProperty name="students" property="lastName"/>
</p>
<p>Student Age: 
   <jsp:getProperty name="students" property="age"/>
</p>

<!-- 在jsp中使用自定义tag -->
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld" %>


<!-- param JSP el 访问信息 -->
<p>${param["username"]}</p>

<p>${header["user-agent"]}</p>

<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
	//获取本地客户端信息
	Locale locale=request.getLocale();
	String language=locale.getLanguage();
	String country=locale.getCountry();
%>

<%
	out.println("Language:"+language+"<br/>");
	out.println("Country:"+country+"<br/>");
%>















</center>
</html>
























