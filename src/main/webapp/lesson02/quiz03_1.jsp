<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI 계산</title>
</head>
<body>
		<h1>BMI 측정 결과</h1>
	<%
			String height = request.getParameter("height");	
			int hei = Integer.valueOf(height);
			String weight = request.getParameter("weight");
			int wei = Integer.valueOf(weight);

			double BMI =  wei / ((hei / 100.0) * (hei / 100.0));
			
			if (BMI <= 20) {
				out.print("저체중");
			} else if (BMI <= 25) {
				out.print("정상");
			} else if (BMI <= 30) {
				out.print("과체중");
			} else {
				out.print("비만");
			}
			
			out.print("<html><head><title>BMI 계산</title></head><body>");
			out.print("<br> BMI 수치:" + BMI);
			out.print("</body></html>");
			

	%>
</body>
</html>