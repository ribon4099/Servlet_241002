package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UrlMappingQuiz01 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request
			, HttpServletResponse response) throws IOException {
		
		//한글깨지는 것 해결 처리 -> Response header에 세팅	(이것은 반드시 위에되어야됨)	
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");  // 순수한 글자로 내린다
		
		PrintWriter out = response.getWriter();  // 뿌릴려면 PrintWriter있어야.
		out.println("안녕하세요");
		
		Date now = new Date();
		out.print(now);
		
		// formatter
		// 2024-09-04 오후 19:51:36 포멧으로 프린트 하려고 한다. "SimpleDateFormat" 구글링하면 나온다
		//오늘의 날짜는 20XX년 X월 X일
		SimpleDateFormat sdf = new SimpleDateFormat("오늘의 날짜는 yyyy년 M월 d일");
		out.println();
		out.println(sdf.format(now));
		
	}

}
