package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz03") // web.xml에서 사용한 것이 이 한줄로 끝난다.

public class UrlMappingQuiz03 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		// 기사 문구를 브라우저에 출력하세요.
		// WebServlet 어노테이션을 이용해서 URL을 Mapping 하세요.
		Date now /*date*/ = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/M/d HH:mm:ss");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html><head><title>마론달 뉴스</title></head><body>");
		out.print("<h1>[단독] 고양이가 야옹해</h1> <br>");  // println해도 br없으면 줄바꿈안된다.
		out.print("기사 입력 시간:" + sdf.format(now) + "<hr>끝");
		//out.println(sdf.format(now));
		//out.print("<span>기사 입력 시간: </span>");
		//out.println(sdf.format(now));
		//out.print("</hr>");
		out.print("</body></html>");

		
	}

}
