<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길이변환_quiz04</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>길이 변화 결과</h1>
	<%
		String length = request.getParameter("length");
		int leng = Integer.valueOf(length);
		
		String[] lengCalArr = request.getParameterValues("lengthcal"); // 선택 항목이 여러개 일 때 getParameterValues()
		String[] name = new String[4];
		
		if(lengCalArr != null) {
			String result = "";  // null 하면 안됨
			//out.print(foodArr);				
				for (int i = 0; i < lengCalArr.length; i++) {
					name[i] = lengCalArr[i];
					out.print(name[i]);
			}
		}
		
		int lengthResult1 = 0;
		int lengthResult2 = 0;
		int lengthResult3 = 0;
		int lengthResult4 = 0;
		
		if (name[0] == "inch") {
			lengthResult1 = leng * 100;
		}
		if (name[1] == "yard") {
			lengthResult2 = leng * 1000;
		}
		if (name[2] == "fit") {
			lengthResult3 = leng * 10000;
		}
		if (name[3] == "meter") {
			lengthResult4 = leng * 100000;
		}		

		out.print("<html><head><title>길이 변화 결과</title></head><body>");
		out.print("<br> 길이(cm):" + leng);
		out.print("<br> inch:" + lengthResult1);
		out.print("<br> yard:" + lengthResult2);
		out.print("<br> fit:" + lengthResult3);
		out.print("<br> meter:" + lengthResult4);
		out.print("</body></html>");
	%>


</body>
</html>