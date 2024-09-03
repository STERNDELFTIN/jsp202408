<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<table border="1" width="90%">
	<tr>
		<td align="center">
		<!-- 로그인 여부에 따른 메뉴 변화 -->
		<% if (session.getAttribute("UserId") == null) { %>
			<a href="../session/loginForm.jsp">로그인</a>
		<% } else { %>
			<a href="../session/logout.jsp">로그아웃</a>
		<% } %>
			<!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
			&nbsp;&nbsp;&nbsp; <!--  메뉴 사이의 공백(space) 확보용 특수 문자 -->
			<a href="../list.jsp">게시판(페이징X)</a>
			&nbsp;&nbsp;&nbsp;
			<a href="../list.jsp">게시판(페이징0)</a>
		</td>
	</tr>
</table>