<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멜롱-아이유</title>
	<!-- bootstrap CDN Link -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<style>
a {text-decoration:none;}
a:hover {text-decoration:none;}

#wrap {width:1200px; margin:auto;}

header {height:100px;}
header .logo {width:150px;}
header .search {width:1050px;}
header .search .search-bar {width:450px;}

nav {height:40px;}

footer {height:200px;}
</style>
</head>
<body>
<%
// 아티스트 정보 

    Map<String, Object> artistInfo = new HashMap<>();
    artistInfo.put("name", "아이유");
    artistInfo.put("debute", 2008);
    artistInfo.put("agency", "EDAM엔터테인먼트");
    artistInfo.put("photo", "https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg");


// 아이유 노래 리스트 
    List<Map<String, Object>> musicList = new ArrayList<>();

    Map<String, Object> musicInfo = new HashMap<>();
    musicInfo.put("id", 1);
    musicInfo.put("title", "팔레트");
    musicInfo.put("album", "Palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 2);
    musicInfo.put("title", "좋은날");
    musicInfo.put("album", "Real");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/3/3c/IU_-_Real.jpg");
    musicInfo.put("time", 233);
    musicInfo.put("composer", "이민수");
    musicInfo.put("lyricist", "김이나");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 3);
    musicInfo.put("title", "밤편지");
    musicInfo.put("album", "palette");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/b/b6/IU_Palette_final.jpg");
    musicInfo.put("time", 253);
    musicInfo.put("composer", "제휘,김희원");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 4);
    musicInfo.put("title", "삐삐");
    musicInfo.put("album", "삐삐");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://ww.namu.la/s/5ea8ba97baf8af3cc13f2972d9d23bcd17e19b8b8a96ce86d50c4bd03ad4df30321fc7e012738ad4b00c50642195ef7a68ff484ad760b15ff46bb1dc45ffb3fc399e4345c5d4dd2240820b59f3a573a57f84b8a6a2e4fb26ce5e81ad66d85f77debc979900275f6cf7a51386c8c39aa9");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "이종훈");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 5);
    musicInfo.put("title", "스물셋");
    musicInfo.put("album", "CHAT-SHIRE");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://w.namu.la/s/4a817b8f4ec9caca4027a6991651a401d683a7691f1926bd60e59908f306d439f7cc251af5ef263a6f0a249e831d5d9cf641855bf590dadd86869ff941aad8dc236bc91bac89f84cff60c981d8d6c85f57a2ff4df00b5efe3bbc10e9745ce13571eda48f1912435423317450475d6ffe");
    musicInfo.put("time", 194);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);

    musicInfo = new HashMap<>();
    musicInfo.put("id", 6);
    musicInfo.put("title", "Blueming");
    musicInfo.put("album", "Love poem");
    musicInfo.put("singer", "아이유");
    musicInfo.put("thumbnail", "https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg");
    musicInfo.put("time", 217);
    musicInfo.put("composer", "아이유,이종훈,이채규");
    musicInfo.put("lyricist", "아이유");
    musicList.add(musicInfo);
%>    

<%
	// 상세 정보를 보여줄 target 세팅
	Map<String, Object> target = null;

	// 1. 목록에서 클릭한 경우 (id값)
	if (request.getParameter("id") != null) {
		Integer paramId = Integer.valueOf(request.getParameter("id"));
		//out.print(":::::::::::##########" + paramId);
		for (Map<String, Object> music : musicList) {
			Integer id = (Integer) music.get("id");
			if (id.equals(paramId)) {
				target = music;
				break;
			}
		}
	}
	
	// 2. 상단에서 검색한 경우 (search값)
	if (request.getParameter("search") != null) {
		String paramSearch = request.getParameter("search");
		// out.print("::::::::::: " + paramSearch);
		for (Map<String, Object> music : musicList) {
			String title = (String) music.get("title");
			if (title.equals(paramSearch)) {
				target = music;
				break;
			}
		}
	}
	
	//out.print(target);
%>
	<div id="wrap">
		<header class="d-flex align-items-center">
			<%-- 로고 영역 --%>
			<div class="col-2">
				<h3><a href="list_template.jsp" class="text-success">Melong</a></h3>
			</div>
			
			<%-- 검색 영역 --%>
			<div class="col-10">
				<form method="get" action="/lesson02/quiz10_info.jsp">
					<div class="input-group">
						<input type="text" class="form-control col-6" name="search">
						<div class="input-group-append">
							<input type="submit" class="btn btn-info" value="검색">
						</div>
					</div>
				</form>
			</div>
		</header>

		<nav>
			<ul class="nav">
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">멜롱차트</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">최신음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">장르음악</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">멜롱DJ</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-dark font-weight-bold">뮤직어워드</a></li>
			</ul>
		</nav>
		
		<section class="contents">
			<%
				if (target != null) { //-- if문 시작
			%> 
		
			<h4 class="mt-4">곡 정보</h4>
			<div class="d-flex  border border-success p-3">
				<div class="music-info">
					<img class="album-size"
						src="https://upload.wikimedia.org/wikipedia/ko/6/65/%EC%95%84%EC%9D%B4%EC%9C%A0_-_Love_poem.jpg">
				</div>
				<div class="ml-4">
					<div class="display-4"><%=target.get("title") %></div>
					<div class="font-weight-bold text-success"><%=target.get("singer") %></div>
					<div class="d-flex mt-3 music-info">
						<div class="text-dark">
							<div>앨범</div>
							<div>재생시간</div>
							<div>작곡가</div>
							<div>작사가</div>
						</div>
						<div class="ml-4">
							<div><%=target.get("album") %></div>
							<div><%=(Integer) target.get("time") / 60 %>:<%= (Integer) target.get("time") % 60 %></div>
							<div><%=target.get("composer") %></div>
							<div><%=target.get("lyricist") %></div>
						</div>
					</div>
				</div>
			</div>
			
			<h4 class="mt-4">가사</h4>
			<hr>
			<div>가사 정보 없음</div>
		</section>
		
		<%  } else {  //-- if문 종료, else문 시작 => target이 없는 경우 %>
		<section>
			<h1>정보 없음</h1>
		</section>
		<%  } %>
				
				
		<hr>
		<footer>
			<small class="text-secondary">Copyright 2024. melong All Rights Reserved.</small>
		</footer>
	</div>
</body>
</html>