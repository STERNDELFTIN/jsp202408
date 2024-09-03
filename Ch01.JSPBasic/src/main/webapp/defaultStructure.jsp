<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
String str = "JSP";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Default Structure</title>
</head>
<body>
	<h2>처음 제작해보는 <%=str %></h2>
	<p>
		<% out.println(str + "의 첫 시작입니다."); %>
	</p>
</body>
</html>