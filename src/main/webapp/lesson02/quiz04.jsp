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

	<div class="container">
		<!-- container는 항상 바깥쪽에 -->
			<h1>길이변환</h1>

		<form method="post" action="/lesson02/quiz04_1.jsp">
		<input type="text" class="form-control col-4" name="length"
		placeholder="길이를 입력하세요.">
		<label>인치<input type="checkbox" name="lengthcal" value="inch"></label>
		<label>야드<input type="checkbox" name="lengthcal" value="yard"></label>
		<label>피트<input type="checkbox" name="lengthcal" value="fit"></label>
		<label>미터<input type="checkbox" name="lengthcal" value="meter"></label>

		<br> <input type="submit" value="변환하기">

		</form>
	</div>
</body>
</html>