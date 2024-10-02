package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz06") // quiz06.html에 기입된 주소를 복사해서 가져온다
public class GetMethodQuiz06 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		// Request Parameter
		int number1 = Integer.parseInt(request.getParameter("number1"));
		int number2 = Integer.parseInt(request.getParameter("number2"));
		
		PrintWriter out = response.getWriter();
	    // json 모양으로 만든다. {"number1": number1, "number2": number2} {''}도 된다 
		// class 쓰면 json 넣어주는 것도 있다. 하지만 여기서는 노가다로 넣는다.
			
	//	//
	//	{
	//	    "addition": 1570,
	//	    "subtraction": 1430,
	//	    "multiplication": 105000,
	//	    "division": 21
	//	}  "만 역슬레시 \ 사용, 숫자는 그대로 사용
		
		out.print("{\"addition\":" + (number1 + number2));
		out.print(", \"subtraction\":" + (number1 - number2));
		out.print(", \"multiplication\":" + (number1 * number2));
		out.print(", \"division\":" + (number1 / number2) + "}");

	}
	

}
