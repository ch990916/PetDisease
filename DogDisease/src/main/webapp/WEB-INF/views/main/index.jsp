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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type = "text/javascript" src="resources/js/myvalidchecker.js"></script>
<script type = "text/javascript" src="resources/js/check.js"></script>
<script type = "text/javascript" src="resources/js/move.js"></script>
<script type = "text/javascript" src="resources/js/jQuery.js"></script>
<script type = "text/javascript" src="resources/js/homepetcare_jQuery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div id="background">
<div id="idxBgTblArea">
	<table id="idxBgTbl">
	<tr><td><table id="indexTable">
		<tr>
		<td class="title"><a href="index">&nbsp;펫홈케어</a></td>
		<th class="menu">진단&nbsp;<span class="material-symbols-outlined">home_health</span></th>
		<th class="menu"><a href="notice.board.go?page=1">공지사항</a></th>
		<th class="menu"><a href="dataroom.go">자료실</a></th>
		<th class="menu">메뉴4</th>
		<td class="login" align="right"><jsp:include page="${loginPage }"></jsp:include></td>
		<td>${joinResult }</td>
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