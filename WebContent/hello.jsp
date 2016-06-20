<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   // 为 first_name 和 last_name设置cookie      
   Cookie firstName = new Cookie("first_name",
 			  request.getParameter("first_name"));
   Cookie lastName = new Cookie("last_name",
			  request.getParameter("last_name"));

   // 设置cookie过期时间为24小时。
   firstName.setMaxAge(60*60*24); 
   lastName.setMaxAge(60*60*24); 

   // 在响应头部添加cookie
   response.addCookie( firstName );
   response.addCookie( lastName );
%>

<ul>
<li><p><b>First Name:</b>
   <%= request.getParameter("first_name")%>
</p></li>
<li><p><b>Last  Name:</b>
   <%= request.getParameter("last_name")%>
</p></li>
</ul>
</body>
</html>