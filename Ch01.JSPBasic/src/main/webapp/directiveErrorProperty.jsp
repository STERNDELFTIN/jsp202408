<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%> <!-- 에러페이지 지정 - isErrorPage -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - errorPage/isErrorPage 속성</title>
</head>
<body>
	<h2>서비스 중 일시적인 오류 발생</h2>
	<p>
		오류명: <%= exception.getClass().getName()%> <br>
		오류 메세지 : <%= exception.getMessage() %>
	</p>
</body>
</html>