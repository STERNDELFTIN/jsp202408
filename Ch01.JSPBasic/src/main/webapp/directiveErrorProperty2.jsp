<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="directiveErrorProperty.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage/isErrorPage 속성</title>
</head>
<body>
	<%
	int age = Integer.parseInt(request.getParameter("age")) + 10; // error
	out.println("10년 후 당신의 나이는 " + age + "입니다."); // No execute
	%>
</body>
</html>