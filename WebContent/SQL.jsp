<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- 找不到驱动需要把对应jar放到lib下 -->
<!-- 同时将对应的jar放到tomcat的lib和自己的web-inf的lib下面 -->
<!-- 当取用特定前面定义的值时，采用$加上{}的形式 -->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/test"
		user="root" password="password"/>
<!-- 可以用c核心标签的set方法实现对值的定义，预定义和解析，便于修改 -->
<c:set var="empId" value="103"></c:set>
<c:set var="helloId" value="102"></c:set>

<sql:update dataSource="${snapshot}" var="count">
	delete from employees where id=?
	<sql:param value="${empId}"/>
</sql:update>

<sql:update dataSource="${snapshot}" var="result">
insert into employees values(109,2,'Nuha','Ali');
</sql:update>


<sql:query dataSource="${snapshot}" var="result">
select * from employees;
</sql:query>
<!-- 使用jsp SQL标签来实现SQL语句 -->
<table border="1" width="100%">
<tr>
   <th>Emp ID</th>
   <th>First Name</th>
   <th>Last Name</th>
   <th>Age</th>
</tr>

<c:forEach var="row" items="${result.rows}">
<!-- c.out核心代码表示对应项目 -->
<tr>
	<td><c:out value="${row.id}"></c:out></td>
	<td><c:out value="${row.first}"></c:out></td>
	<td><c:out value="${row.last}"></c:out></td>
	<td><c:out value="${row.age }"></c:out></td>
</tr>
</c:forEach>
</table>

</body>
</html>





























