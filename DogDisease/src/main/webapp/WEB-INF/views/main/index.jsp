<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
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
=======
<link href="resources/css/output.css" rel="stylesheet">
>>>>>>> origin/branch_JinMyeong
<script type = "text/javascript" src="resources/js/myvalidchecker.js"></script>
<script type = "text/javascript" src="resources/js/check.js"></script>
<script type = "text/javascript" src="resources/js/move.js"></script>
<script type = "text/javascript" src="resources/js/jQuery.js"></script>
<script type = "text/javascript" src="resources/js/homepetcare_jQuery2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</head>
<<<<<<< HEAD
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
=======
<body style="background-image:url('resources/petHome.jpg');  height:'100%'; width:'100%'">
	<div class="grid grid-cols-3 bg-purple-400 bg-opacity-75 h-auto pb-4 mb-12" id="idxBgTbl">
		<div class="mt-4">
			<a class="mx-2 pt-4 text-4xl font-bold text-white hover:text-black" href="index">펫홈케어</a>
		</div>
		<div class="mr-4 align-center">
			<div class="pt-4 grid grid-flow-col-dense gap-2 grid-rows-1 align-center">
				<div class="row-auto align-middle">
					<a class="appearance-none text-2xl text-gray-600 font-bold hover:text-white" href="diagnosis.go">진단</a>
				</div>
				<div class="row-auto align-middle">
					<a class="text-2xl text-gray-600 font-bold hover:text-white" href="map.go">병원 찾기</a>
				</div>
				<div class="row-auto align-middle">
					<a class="text-2xl text-gray-600 font-bold hover:text-white" href="notice.go?page=1">공지사항</a>
				</div>
				<div class="row-auto">
					<a class="text-2xl text-gray-600 font-bold hover:text-white" href="board.go?page=1">자유게시판</a>
				</div>
			</div>
		</div>	
		<div class="m-2">
			<jsp:include page="${loginPage }"/>
			<div class="text-white font-bold">${result }</div>
		</div>
	</div>
	<div class="h-full">
		<div class="pt-6 h-full w-full bg-gray-200" align="center">
			<jsp:include page="${contentPage }"/>
		</div>
>>>>>>> origin/branch_JinMyeong
	</div>
<footer class="pt-4 bg-gray-600 h-24">
        <p class="place-self-center">회사 정보 | 접종 정보 | 이용 약관 | 개인정보 보호 정책 | 연락처 정보</p>
</footer>
</body>
</html>