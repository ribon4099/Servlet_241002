<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int length = Integer.parseInt(request.getParameter("length"));
		String[] types = request.getParameterValues("type");
	%>


	<div class="container">
		<!-- container는 항상 바깥쪽에 -->
		<h1>길이 변환 결과</h1>
		<h3><%= length %>cm</h3>
		<hr>
		
		<h2>
			<%
				if (types != null) { 
				for (int i = 0; i < types.length; i++) { // 0 1 2
					if (types[i].equals("inch")) {
						double inch = length * 0.393701;
						out.print(inch + " in<br>");
					} else if (types[i].equals("yard")) {
						double yard = length * 0.0109361;
						out.print(yard + " yd<br>");
					} else if (types[i].equals("feet")) {
						double feet = length * 0.0328084;
						out.print(feet + " ft<br>");
					} else if (types[i].equals("meter")) {
						double meter = length / 100.0;
						out.print(meter + " m");						
					}
				}
			}
			%>
		
		</h2>

</body>
</html>