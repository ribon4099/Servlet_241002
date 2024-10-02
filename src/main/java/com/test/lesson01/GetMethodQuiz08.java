package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz08") // GetMethodEx04 참조
public class GetMethodQuiz08 extends HttpServlet{
	
	List<String> list = new ArrayList<>(Arrays.asList(
	        "강남역 최고 맛집 소개 합니다.", 
	        "오늘 기분 좋은 일이 있었네요.", 
	        "역시 맛집 데이트가 제일 좋네요.", 
	        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
	        "자축 저 오늘 생일 이에요."));	

	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		// request params (F8: 디버깅 종료)

		String keyword = request.getParameter("keyword"); // name="userId" 여기거A 가져온다
		
		PrintWriter out = response.getWriter();   // ctrl+D는 한줄 삭제
		
		out.print("<html><head><title>주문 결과</title></head><body>");
		out.print(keyword + "<br>");
		out.print(list.get(0) + "<br>");
		out.print(list.get(1) + "<br>");
		out.print(list.get(2) + "<br>");
		out.print(list.get(3) + "<br>");
		out.print(list.get(4) + "<br>");
		out.print("<hr>");
		
		for (int i = 0; i < list.size(); i++) { // 0 ~ 4 index까지
			String text = list.get(i);
			if (text.contains(keyword)) {
				out.print(text + "<br>");
				
				// 맛집 -> <b>맛짐<b>  "bold체 적용 방법"
				// 1) 이것이 좋은 방법  
				//text = text.replace(keyword, "<b>" + keyword + "<b>");
				// out.print(text + "<br>");
				// 2) 검색된 단어를 기준으로 댕강 자른다.
				String[] words = text.split(keyword); // 0, 1
				out.print(words[0] + "<br>" + keyword + "</b>" + words[1] + "<br>");
			}
		}
		out.print("</body></html>");
		
		/*if (list.get(0).contains(keyword)) {
			out.print(list.get(0));
		} else {
			out.print("keyword 단어없음");
		}*/
		
		/*내가푼것 out.print("<html><head><title>주문 결과</title></head><body>");
		out.print(search + "<br>");
		out.print(list.get(0) + "<br>");
		out.print(list.get(1) + "<br>");
		out.print(list.get(2) + "<br>");
		out.print(list.get(3) + "<br>");
		out.print(list.get(4) + "<br>");
		out.print("<hr>");
		
		for (int i = 0; i < 5; i++) {
			list.get(i).contains(keyword)
		}
		
		if (list.get(0).contains(keyword)) {
			out.print(list.get(0));
		} else {
			out.print("keyward 단어없음");
		}
		out.print("</body></html>");*/
		
		
	}

}
