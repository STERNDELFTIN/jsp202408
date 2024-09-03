<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	
	<%
	// DB에 연결
	JDBConnect jdbc = new JDBConnect();
	
	// 쿼리문 생성
	String sql = "SELECT id, pass, name, regidate FROM member";
	Statement stmt = jdbc.con.createStatement();
	
	//쿼리 수행
	ResultSet rs = stmt.executeQuery(sql); // ResultSet은 조회 결과를 담고 있는 집합
	
	// 결과 확인(웹 페이지에 출력)
	while(rs.next()){ // next()는 ResultSet 객체에서 다음 행(레코드) 반환
		// get 계열 메서드들에서 컬럼을 지정할 때는 인덱스와 컬럼멸 둘 다 사용 가능
		// 단, 컬럼명을 사용하면 차후 테이블에서 새로운 컬럼이 추가되거나 순서가 변경되어도 소스 코드 수정 없이 사용할 수 있는 이점 존재
		String id = rs.getString(1);
		String pw = rs.getString(2);
		String name = rs.getString("name"); 
		java.sql.Date regidate = rs.getDate("regidate");
		
		out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
	}
	
	// 연결 닫기
	jdbc.close();
	%>
</body>
</html>