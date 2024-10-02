<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>	
<!DOCTYPE html>
<html>
<head>
<title>홍당무 마켓</title>
<meta charset="utf-8">

<!-- bootstrap CDN Link -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<style>
#wrap {width:1000px; margin:auto;}

header {
    height:100px;
    background-color: coral;
}

header > .logo {
    width:300px;
    color:coral
}

nav {
    height:60px;
    background-color: coral;
}

nav > .nav-box {
    width:600px;
}

.main-link {
    
    font-size: 20px;
    color:white;
    font-weight: bold;
}

.main-link:hover {
    font-size: 20px;
    color:lightgray;
}


section > .input-box {
    width:600px;
}

footer {
    height:80px;
}

.goods-box {
    border: 2px solid coral;
    padding:10px;
}

.goods-box:hover {
    background-color:#ffebe3;
}

.goods-box > .goods-image-box {
    width: 300px;
    height: 180px;
    overflow: hidden;
}

.goods-box > .title {
    font-size: 18px;
    font-weight: bold;
}

.goods-box > .price {
    color: gray;
}

.goods-box > .seller {
    font-size: 18px;
    color:coral;
}


</style>
</head>
<body>
<%
	//데이터 가져오기 - 판매자, 물건을 조인해서 가져온다.
	MysqlService mysqlService = MysqlService.getInstance();
	mysqlService.connect();
	
	String query = "select A.nickname, B.title, B.price, B.pictureUrl from seller AS A	join used_goods AS B on A.id = B.sellerId";
	ResultSet result = mysqlService.select(query);
%>
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<h1 class="text-white">HONG당무 마켓</h1>
		</header>
		<nav class="d-flex justify-content-center">
			<div class="w-100">
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="/lesson03/quiz03_list.jsp" class="nav-link main-link">리스트</a></li>
					<li class="nav-item"><a href="/lesson03/quiz03_add.jsp" class="nav-link main-link">물건	올리기</a></li>
					<li class="nav-item"><a href="#" class="nav-link main-link">마이 페이지</a></li>
				</ul>
			</div>
		</nav>
	
		<section class="mt-4 d-flex justify-content-center">
			<div class="d-flex flex-wrap">
				<%
		             while (result.next()) {
		        %>
				<%-- goods-box가 상품 하나의 영역 --%>
				<div class="goods-box mb-3 mr-2">
					<div class="goods-image-box ">
					
						<%-- 이미지 없는 경우 --%>
						<%	if (result.getString("pictureUrl") == null || result.getString("pictureUrl").equals("")) { %>
						<div class="d-flex h-100 justify-content-center align-items-center">
							<h4 class="text-secondary">이미지 없음</h4>
						</div>
						
						<%-- 이미지 있는 경우 --%>
						<%
		             		} else {
						%>
						<div class="goods-image-box">
							<img class="w-100" src="<%= result.getString("pictureUrl") %>">
						</div>             			
		             	<%	
		             		}
						%>
					</div>
					<div class="title mt-1"><%= result.getString("title") %></div>
					<div class="price mt-1"><%= result.getString("price") %>원</div>
					<div class="seller mt-1"><%= result.getString("nickname") %></div>
				</div>
				<% 	} %>
			</div>
		</section>	
		
		<footer class="mt-5 text-center">
			<small class="text-secondary">Copyright 2025. HONG All Rights Reserved.</small>
		</footer>
	</div>
	<%
		mysqlService.disconnect();
	%>

</body>
</html>	