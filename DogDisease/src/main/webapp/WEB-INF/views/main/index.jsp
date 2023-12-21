<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
<script type = "text/javascript" src="resources/js/myvalidchecker.js"></script>
<script type = "text/javascript" src="resources/js/check.js"></script>
<script type = "text/javascript" src="resources/js/move.js"></script>
<script type = "text/javascript" src="resources/js/jQuery.js"></script>
<script type = "text/javascript" src="resources/js/homepetcare_jQuery2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</head>
<body>
	<div class="grid grid-cols-3 fixed inset-x-0 top-0 left-0 bg-purple-400 bg-opacity-75 h-auto pb-4">
		<div class="text-4xl font-bold text-white mt-2">
			<a class="mx-2" href="index">펫홈케어</a>
		</div>
		<div class="col-auto pt-2">
			<div class="grid grid-flow-col-dense gap-2 grid-rows-1 grid-cols-3 align-center">
				<div class="row-auto align-middle">
					<a class="text-2xl text-gray-600 font-bold hover:text-white" href="#">진단</a>
				</div>
				<div class="row-auto align-middle">
					<a class="text-2xl text-gray-600 font-bold hover:text-white" href="notice.go?page=1">공지사항</a>
				</div>
				<div class="row-auto">
					<a class="text-2xl text-gray-600 font-bold hover:text-white" href="board.go?page=1">자유게시판</a>
				</div>
			</div>
		</div>
		<div class="col-auto place-contant-end">
			<div><jsp:include page="${loginPage }"/></div>
			<div class="text-white font-bold">${result }</div>
		</div>
	</div>
	
<body class="mt-24 h-full" style="background-image:url('resources/petHome.jpg')">
	<div class="h-full w-full bg-gray-200" align="center">
			<jsp:include page="${contentPage }"/>
	</div>
	
<footer>
	copyright by ###
</footer>
</body>
</html>