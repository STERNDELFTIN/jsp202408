<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Object - request</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	
	<ul>
		<!-- getMethod()는 GET 및 POST 같은 전송 방식 반환 -->
		<li>데이터 전송 방식 : <%= request.getMethod() %></li>
		<!-- URL은 호스트를 포함한 전체 주소 반환 -->
		<li>URL : <%= request.getRequestURL() %></li>
		<!-- URI는 호스트를 제외한 컨텍스트 루트부터의 주소 (컨텍스트 루트 : 호스트명 다음에 나오는 프로젝트명) -->
		<li>URI : <%= request.getRequestURI() %></li>
		<li>protocol : <%= request.getProtocol() %></li>
		<li>Server Name : <%= request.getServerName() %></li>
		<li>Server Port : <%= request.getServerPort() %></li>
		<!-- 클라이언트의 IP 주소 반환 -->
		<li>Client IP Address : <%= request.getRemoteAddr() %></li>
		<!-- 요청 주소 뒷부분의 매개변수 전달을 위한 쿼리스트링 전체 반환 -->
		<li>Query String : <%= request.getQueryString() %></li>
		<!-- 쿼리스트림 중 특정 키값을 얻어오려면 getParameter()에 키값을 인수로 삽입 -->
		<li>전송된 값 1 : <%= request.getParameter("eng") %></li>
		<li>전송된 값 2 : <%= request.getParameter("han") %></li>
	</ul>
</body>
</html>