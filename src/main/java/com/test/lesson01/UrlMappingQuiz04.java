package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz04")
public class UrlMappingQuiz04 extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 브라우저에 어떻게 응답해줄 것인지 아래에 작성하는 것이다.
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		// list 30개, ul은 반복이 아니니까 앞, 뒤에 넣는다.
		out.print("<html><head><title>리스트 출력</title></head><body><ul>");
		for (int i = 1; i <= 30; i++) {
			out.print("<li>" + i + "번째 리스트</li>");
		}		
		out.print("</ul></body></html>");
		
	}
	
}
