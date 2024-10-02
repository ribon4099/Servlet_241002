package com.test.lesson01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/lesson01/quiz07") // GetMethodEx04 참조
public class GetMethodQuiz07 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		// request params (F8: 디버깅 종료, F6: 디버깅 한칸씩이동)

		String address = request.getParameter("address"); // name="userId" 여기거A 가져온다
		String card = request.getParameter("card"); // name="userId" 여기거A 가져온다
		int price = Integer.parseInt(request.getParameter("price")); // name="userId" 여기거A 가져온다
		
		
		PrintWriter out = response.getWriter();   // ctrl+D는 한줄 삭제
		
		out.print("<html><head><title>주문 결과</title></head><body>");
		
		if (address.contains("서울시") == false) {
			out.print("배달 불가 지역입니다");
		} else if (card.contains("신한") ) {
			out.print("결재 불가 카드 입니다");
		} else {
			out.print(address + " <b> 배달 준비중</b>");
			out.print("<br>결재 금액:" + price);
		}
		
		/*String str = address; (내가짠것)
		String crd = card;
		
		if (str.contains("서울")) {
			out.print("주소" + address + "배달 준비중" + "<br>");
			out.print("결재금액" + price + "<br>");
		} else {
			out.print("배달불가 지역");
		}
		
		if (crd.contains("신한")) {
			out.print("결재 불가 카드입니다");
		} */
		out.print("</body></html>");
	}
}
