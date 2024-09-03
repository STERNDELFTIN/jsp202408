<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exception 내장 객체</title>
</head>
<body>
<%
int status = response.getStatus(); // response 내장 객체로부터 에러 코드 확인

// 에러 코드에 따라 적절한 메시지 출력
if (status == 404){
out.print("404 에러 발생");
out.print("<br/>파일 경로 확인 바람");
}
else if (status == 405){
out.print("405 에러 발생");
out.print("<br/>요청 방식(method) 확인 바람");
}
else if (status == 500){
out.print("500 에러 발생");
out.print("<br/>소스 코드에 오류가 없는지 확인 바람");
}
%>

</body>
</html>