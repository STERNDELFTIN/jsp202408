<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 내장 객체</title>
</head>
<body>
	<h2>web.xml에 설정한 내용 읽어오기</h2>
	<%--
	getInitParameter() 메서드를 이용해서 web.xm에 설정한 초기화 매개변수를 읽어옴
	web.xml에서 "INIT_PARAM"을 설정X, null 반환
	--%>
	초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %>
	
	<h2>서버의 물리적 경로 얻어오기</h2>
	<%--
	getRealPath() 메서드로 현재 작성 중인 폴더의 물리적 경로를 받아와 출력
	인수로는 '컨텍스트 루트를 제외한' 경로를 입력
	--%> 
	application 내장 객체 : <%= application.getRealPath("/physicalPath") %>
	
	<h2>선언부에서 application 내장 객체 사용하기</h2>
	<%!
	// 선언부에 정의한 메서드
	// 둘 다 같은 물리적 경로를 반환하지만, 이때 필요한 서블릿 컨텍스트를
	public String useImplicationObject() {
		// this로부터 얻음
		return this.getServletContext().getRealPath("/physicalPath");
	}
	public String useImplicitObject(ServletContext app){
		// 매개변수로 받음
		return app.getRealPath("/physicalPath");
	}
	%>
	<ul>
		<%-- this를 이용하여 호출 --%> 
		<li>this.사용 : <%= useImplicationObject() %></li>
		<%-- 내장객체를 인수로 하여 호출 --%>
		<li>내장 객체를 인수로 전달 : <%= useImplicitObject(application) %></li>
	</ul>
</body>
</html>