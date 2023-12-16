<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css" rel="stylesheet">
<script type = "text/javascript" src="resources/js/myvalidchecker.js"></script>
<script type = "text/javascript" src="resources/js/check.js"></script>
<script type = "text/javascript" src="resources/js/move.js"></script>
<script type = "text/javascript" src="resources/js/jQuery.js"></script>
<script type = "text/javascript" src="resources/js/homepetcare_jQuery2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<header>
	<div class="grid grid-flow-col gap-2 grid-rows-1 border-solid border-4 border-white bg-opacity-10 bg-purple-400">
		<div class="row-auto text-4xl font-bold border-solid border-4 border-gray-100"><a href="index">&nbsp;펫홈케어</a></div>
		<div  class="row-auto border-solid border-4 border-black">
			<div>
				<jsp:include page="${loginPage }"/>
			</div>
			<div>
				${joinResult }
				${loginResult }
			</div>
		</div>
	</div>
		<div>
			진단&nbsp;<span>home_health</span>
			<a href="notice.go?page=1">공지사항</a>
			<a href="board.go?page=1">자유게시판</a>
		</div>
</header>
<body style="background-image:url('resources/petHome.jpg')">
<div class="border-solid border-4 border-black">
		<div>
			<jsp:include page="${contentPage }"/>
		</div>
	</div>
</body>
<footer>
	copyright by ###
</footer>
</html>