<%@ page import="vo.MemberVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.MemberDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./header.jsp" %>
<%@ include file="./menu.jsp" %>

<section>
	<hr>
	<h1>회원 입력 화면</h1>
	<table>
		<tr>
			<th>이름</th>
			<th>전화번호</th>
		</tr>
		
		<%
		ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("memberlist");
		
		if (list != null){
			
			for (MemberVO vo : list) {
		%>
		
		<tr>
			<td><%= vo.getName() %></td>
			<td><%= vo.getTel() %></td>
		</tr>
		
		<%
			}
		}
		%>
	</table>
	
	<a href="/index.jsp">홈으로</a>
	<hr>
</section>

<%@ include file="./footer.jsp" %>