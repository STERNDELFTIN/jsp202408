<%@ page import="java.sql.PreparedStatement" %>
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
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	
	<%
	// DB에 연결
	JDBConnect jdbc = new JDBConnect();
	
	// 테스트용 입력값 준비 (하드코딩)
	String id = "test1";
	String pass = "1111";
	String name = "테스트1회원";
	
	/* 원래는 form값 전송받음 */
	/* String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name"); */
	
	// 쿼리문 생성
	String sql = "insert into member values(?, ?, ?, sysdate)"; // SQL문 문자열 정의 // 인파라미터(?) : 정확한 값을 나중에 채워줌
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	/* 인파라미터들에 실제 값 대입(setString()의 첫 번째 매개변수가 인파라미터의 순서를 뜻함. DB에서는 인덱스가 1부터 시작) */
	psmt.setString(1, id);
	psmt.setString(2, pass);
	psmt.setString(3, name);
	
	// 쿼리 수행
	int inResult = psmt.executeUpdate(); // 만약 실행한 쿼리문이 UPDATE나 DELETE였다면 수정 혹은 삭제된 레코드의 수가 반환됨
	out.println(inResult + "행이 입력되었습니다.");
	
	// 연결 닫기
	jdbc.close();
	%>
</body>
</html>