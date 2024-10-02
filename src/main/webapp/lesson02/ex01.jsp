<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>JSP</h1>

	<!-- HTML 주석: 소스보기에서 보임 -->
	<%--JSP주석: 소스보기에서 안보임 --%>
	<%--%가 있는 곳은 java영역이다 , http://localhost:80/lesson02/ex01.jsp--%>
	<%
	// 자바 문법 시작
	// scriptlet

	int sum = 0;
	for (int i = 0; i <= 10; i++) {
		sum += i;
	}
	%>

	<%
	// 자바 문법 시작 위의 % 구문이 계속 이어진다
	// scriptlet
	// expression 문법 (세미콜론안쓴다)과 scriptlet 문법만 쓰면 된다
	%>

	<b>합계:</b>
	<input type="text" value="<%=sum%>">
	
	<hr>
	
	<%!
		// 선언문 - 클래스 같은 느낌
		
		// 필드
		int num = 100;
		
		//메소드
		public String getHelloWorld() {
			return "hello world!";
		}
	
	%>
	
	<%= num + 200 %>
	
	<br>
	<%= getHelloWorld() %>
	
	<%
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	%>


</body>
</html>