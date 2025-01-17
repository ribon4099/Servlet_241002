package com.test.lesson03;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/lesson03/quiz01")
public class quiz01 extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// response header 세팅
		response.setContentType("text/plain");
		
		// DB 연결 (접속)
		MysqlService ms = MysqlService.getInstance();
		ms.connect();  // !!!!!!!꼭 불러야함. 실질적인 DB 연결
		
		// 테이블 insert (웹페이지 진입떄 마다 insert가 1회씩 반복됨, 1번만 할것)
		String insertQuery = "insert into `real_estate`"
				+ "(`realtorId`,`address`,`area`,`type`, `price`, `rentPrice`)"
				+ "values"
				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', '1500000', NULL)";
		try {
			ms.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 테이블 조회 및 출력
		String selectQuery = "select * from `real_estate`"
							+ "order by `id` desc "
							+ "limit 10";
		
		try {
			PrintWriter out = response.getWriter();
			ResultSet res = ms.select(selectQuery);
			while (res.next()) { // 결과 행이 있는 동안 수행
				out.println("매물주소:" + res.getString("address") 
				+ ", 면적:" + res.getInt("area") 
				+ ", 타입:" + res.getString("type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 연결 해제			
		ms.disconnect();
		
	}

}
