package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz02 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 한글깨짐 처리
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");  // 글자_text인데 plain으로 순수 글자이다 (글자인데_html등도 될수 있음)
		

		
		Date date = new Date();  // import는 꼭 util로 해야됨
			
		SimpleDateFormat sdf = new SimpleDateFormat("현재 시간은 HH시 mm분 ss초 입니다."); // 이것은 정의
		PrintWriter out = response.getWriter(); // 실재 출력 명령임
		out.println("안녕!!");
		out.println();  // 실재 출력 명령임
		out.println(sdf.format(date));
		
		
		
	}

}
