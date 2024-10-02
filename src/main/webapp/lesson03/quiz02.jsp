<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력하기_사이트추가</title>
</head>
<body>

<%--
	flow
	1) 유저 추가: ex02.jsp (input 폼화면) -> InsertEx02 서블릿(DB Insert) 
	   -> 결과물을 ex02_1.jsp(유저목록, DB select)	
--%>

<form method="post" action="/lesson03/insert_quiz02">
	<p>
		<b>사이트명:</b>
		<input type="text" name="name">	
	</p>
	<p>
		<b>사이트주소:</b>
		<input type="text" name="url">	
	</p>
	
	<input type="submit" value="추가">

</form>

</body>
</html>