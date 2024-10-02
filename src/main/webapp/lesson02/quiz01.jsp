<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Quiz01</title>
</head>
<body>

	<h1>JSP Quiz01</h1>

	<!-- http://localhost:80/lesson02/quiz01.jsp -->

	<%
	// 1) 1부터 n까지의 합계를 구하는 함수

	//public int getSum(int end) {
	/*	int sum = 0;
		for (int i = 1; i <= end; i++) {
			sum += i;
		}
		return sum;*/
	//}
	//
	%>

	<%
	//2. 점수들의 평균 구하기
	// 스크립틀릿(scriptlet% % )문법을 사용해서 주어진 점수들의 평균을 구하세요.
	// int[] scores = {81, 90, 100, 95, 80};
	int[] scores = { 81, 90, 100, 95, 80 };

	int sum = 0;
	for (int i = 0; i < scores.length; i++) {
		sum += scores[i];
	}
	double average = (double) sum / (double) scores.length;
	%>

	<%
	// 3.
	/*List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	Iterator<String> iter = scoreList.iterator();

	int score = 0;
	while (iter.hasNext()) {
		String answer = iter.next();
		if (answer.equals("0")) {
			score += 100 / scoreList.size();
			
		}
	}*/
	int score = 0;
	%>

	<%
	String birthDay = "20010820";
	String yearStr = birthDay.substring(0, 4);
	//out.print(yearStr);
	int age = 2024 - Integer.valueOf(yearStr);
	%>
	</h2>
	<h2>
		평균 점수는
		<%=average%>
		입니다.
	</h2>
	<h2>
		채점 결과는
		<%=score%>점 입니다.
	</h2>
	<h2>
		<%= birthDay%> 의 나이는
		<%=age%>세 입니다.
	</h2>
	<hr>

</body>
</html>