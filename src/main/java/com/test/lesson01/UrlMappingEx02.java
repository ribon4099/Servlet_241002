package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex02")  // web.xml에서 사용한 것이 이 한줄로 끝난다.

public class UrlMappingEx02 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");  // text 내려가면 html이니 tag 해석해라 의미이다
		
		PrintWriter out = response.getWriter();
		
		// 1 + 2 + 3 + ... + 10
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			sum += i;			
		}
		// 아래 3개의 out.print문은 연속된 것이다. (3개 줄로 되어 있지만 연속으로 인식)
		out.println("<html><head><title>합계</title></head><body>");
		out.print("합계: <b>" + sum + "</b>");
		out.print("</body></html>");
	}
}
