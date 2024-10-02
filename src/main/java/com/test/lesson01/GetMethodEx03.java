package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/ex03")
public class GetMethodEx03 extends HttpServlet{
	// 조금전 src 만든 Web 페이지와 전혀 상관없음
	@Override
	public void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json"); //"text/plain"
		
		// Request Parameter
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
		// json 모양으로 만든다. {"user_id": "marobiana", "name": "신보람", "age":30} {''}도 된다 
		// class 쓰면 json 넣어주는 것도 있다. 하지만 여기서는 노가다로 넣는다.
		out.print("{\"user_id\":\"" + userId + "\", \"name\":\""
				+ name + "\", \"age\":" + age + "}");
		
		/*out.println("결과");
		out.println("사용자 아이디:" + userId);
		out.println("이름:" + name);
		out.println("나이:" + age);*/
		
		
	}
}
