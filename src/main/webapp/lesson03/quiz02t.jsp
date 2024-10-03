<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
  	<!-- bootstrap CDN Link -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
<%= 파일명: bookmark_list.jsp =%>
<%
	// db 연결
	MysqlService mysql = MysqlService.getInstance();
	mysql.connect();
	
	String selectQuery = "select * from `bookmark` order by id desc";
	ResultSet result = mysql.select(selectQuery);
%>
	<div class="container">
		<h1 class="text-center">즐겨찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>사이트명</th>
					<th>사이트 주소</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%
			while (result.next()) {
			%>
				<tr>
					<td><%=result.getString("name") %></td>
					<td><a href="<%=result.getString("url") %>"><%=result.getString("url") %></a></td>
					<td><a href="/lesson04/quiz02_delete?id=<%=result.getInt("id")%>">삭제하기</a></td>
				</tr>
			<%
			}
			%>
			</tbody>
		</table>
	</div>

<%
	//db 연결 해제
	mysql.disconnect();
%>
</body>
</html>