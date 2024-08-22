<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String str1 = "Hello";
String str2 = "안녕하세요.";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<br>
<%
out.println(str1 + ", " + str2);
%>
</body>
</html>