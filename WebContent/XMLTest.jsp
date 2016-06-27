<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<title>Test</title>
</head>
<body>

<c:import var="bookInfo" url="http://localhost:9099/Test/books.xml"></c:import>
<!-- parse 语法分析 -->
<x:parse xml="${bookInfo}" var="output"/>
<b>Title</b>
<x:out select="$output/books/book[1]/name"/>
<br>
<b>Price sec</b>
<x:out select="$output/books/book[2]/price"/>






</body>
</html>