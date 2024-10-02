package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex05")  // 원래 작업 순서는 Servlet을 먼저 작성하고 html을 작성한다.
public class PostMethodEx05 extends HttpServlet{
//POST는 브라우저 주소창에서 다시 치면 안됨(에러남). 반드시 HTML 본문에서 저장 버튼 눌러서 진행해야됨
//POST는 F5 누르는 것은 된다.
	@Override
		public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			
			String userId = request.getParameter("userId");  // 여기 디버깅: 올떄 잘못? 확인가능
			// POST는 한글 input에서 servlet 넘어올 때부터 깨진다.
			String name = request.getParameter("name");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			
			//테이블로 출력
			PrintWriter out = response.getWriter();
			out.print("<html><head><title>회원정보</title></head><body>");
			out.print("<table border=1>");
			out.print("<tr><th>아이디</th><td>" + userId + "</td></tr>");
			out.print("<tr><th>이름</th><td>" + name + "</td></tr>");
			out.print("<tr><th>생년월일</th><td>" + birth + "</td></tr>");
			out.print("<tr><th>이메일</th><td>" + email + "</td></tr>");
			out.print("</body></html>");
		}
	
}
