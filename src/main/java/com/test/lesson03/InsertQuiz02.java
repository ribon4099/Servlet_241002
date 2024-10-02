package com.test.lesson03;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/insert_quiz02")
public class InsertQuiz02 extends HttpServlet{

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response header 생략
		
				// request parameter 꺼내기
				
				String name = request.getParameter("name");
				String url = request.getParameter("url");
				
				// DB 연결
				MysqlService ms = MysqlService.getInstance();
				ms.connect();
				
				// insert 쿼리 수행
				String insertQuery = "insert into `bookmark`"
						+ "(`name`,`url`)"
						+ "values"
						+ "('" + name + "', '" + url + "')";
				
				try {
					ms.update(insertQuery);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				// DB 연결 해제
				ms.disconnect();
				
				// 유저 목록 화면으로 이동 => redirect
				response.sendRedirect("/lesson03/quiz02_1.jsp");
	}
	
}
