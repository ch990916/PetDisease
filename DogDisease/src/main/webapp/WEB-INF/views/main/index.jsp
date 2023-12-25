<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css" />
<link href="resources/css/login.css" rel="stylesheet" type="text/css" />
<link href="resources/css/join.css" rel="stylesheet" type="text/css" />
<link href="resources/css/board.css" rel="stylesheet" type="text/css" />
<link href="resources/css/notice.css" rel="stylesheet" type="text/css" />
<link href="resources/css/map.css" rel="stylesheet" type="text/css" />
<link href="resources/css/diagnosis.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link href="resources/css/output.css" rel="stylesheet">
<script type = "text/javascript" src="resources/js/myvalidchecker.js"></script>
<script type = "text/javascript" src="resources/js/check.js"></script>
<script type = "text/javascript" src="resources/js/move.js"></script>
<script type = "text/javascript" src="resources/js/jQuery.js"></script>
<script type = "text/javascript" src="resources/js/homepetcare_jQuery2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<input id="state" type="hidden" value="${state }">
<div id="background">
<div id="idxBgTblArea">
	<div style="width:100vw"></div>
	<table id="idxBgTbl">
	<tr><td><table id="indexTable">
		<tr>
		<td class="title"><a href="index">&nbsp;펫홈케어</a></td>
		<th class="menu"><a href="diagnosis.go">진단&nbsp;<span class="material-symbols-outlined">home_health</span></a></th>
		<th class="menu"><a href="notice.board.go?page=1">공지사항</a></th>
		<th class="menu"><a href="board.go?page=1">게시판</a></th>
		<th class="menu"><a href="map.go">병원찾기</a></th>
		<td class="login" align="right"><jsp:include page="${loginPage }"></jsp:include></td>
		</tr>
	</table></td></tr>
	</table>
</div>
	<table class="mainPage" align="center">
		<tr align="center"><td><jsp:include page="${contentPage }"></jsp:include></td></tr>
	</table>
	</div>
</body>
</html>