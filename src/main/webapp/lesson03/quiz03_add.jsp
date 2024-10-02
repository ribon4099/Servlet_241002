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
	// 판매자 아이디 정보들을 가져온다
	MysqlService mysqlService = new MysqlService();
	mysqlService.connect();
	
	String query = "select id, nickname from seller";
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
	
		<section class="mt-5 d-flex justify-content-center">
			<div>
				<div class="display-4">물건 올리기</div>
				<div class="input-box mt-5">
					<form id="inputForm" action="/lesson03/quiz03_insert" method="POST">
						<div class="d-flex justify-content-between">
							<select class="form-control col-3" id="sellerId" name="sellerId">
								<option value="default">-아이디 선택-</option>
								<%
									// 판매자 아이디 목록들
									while (result.next()) {
								%>
								<option value="<%=result.getInt("id") %>"><%=result.getString("nickname") %></option>
								<%
									}
								%>						
								
							</select> <input type="text" class="form-control col-5" name="title"
								placeholder="제목" id="titleInput">
							<div class="input-group  col-3">
								<input type="text" class="form-control" name="price"
									placeholder="가격" id="priceInput">
								<div class="input-group-append">
									<span class="input-group-text">원</span>
								</div>
							</div>
		
						</div>
						
						<textarea class="form-control mt-3" cols="100" rows="5" name="description"></textarea>
						
						<div class="input-group mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text">이미지 url</span>
							</div>
							<input type="text" class="form-control " name="imageUrl">
		
						</div>
						<input type="submit" value="저장" class="btn btn-light btn-block mt-3">
					</form>
				</div>
			</div>
		</section>
		
		<footer class="mt-5 text-center">
			<small class="text-secondary">Copyright 2025. HONG All Rights Reserved.</small>
		</footer>
	</div>
	<%
		mysqlService.disconnect();
	%>
	
<script>
	$(document).ready(function() {
		$("#inputForm").on("submit", function(e) {

			var title = $("#titleInput").val();
			var price = $("#priceInput").val();

			if ($("#sellerSelect").val() == "default") {
				alert("판매자를 선택하세요.");
				return false;
			}

			if (title == null || title == "") {
				alert("제목을 입력하세요.");
				return false;
			}

			if (price == null || price == "") {
				alert("가격을 입력하세요.");
				return false;
			}

			return true;
		});
	});
</script>

</body>
</html>	