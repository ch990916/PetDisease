<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/output.css" rel="stylesheet">
<script type = "text/javascript" src="resources/js/myvalidchecker.js"></script>
<script type = "text/javascript" src="resources/js/check.js"></script>
<script type = "text/javascript" src="resources/js/move.js"></script>
<script type = "text/javascript" src="resources/js/jQuery.js"></script>
<script type = "text/javascript" src="resources/js/homepetcare_jQuery2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</head>
<body style="background-image:url('resources/petHome.jpg')">
	<div class="grid grid-cols-3 bg-purple-400 bg-opacity-75 h-auto pb-4">
		<div class="text-4xl font-bold text-white mt-2">
			<a class="mx-2" href="index">펫홈케어</a>
		</div>
		<div class="pt-2 mr-4">
			<div class="grid grid-flow-col-dense gap-2 grid-rows-1 grid-cols-3 align-center">
				<div class="row-auto align-middle">
					<a class="appearance-none text-2xl text-gray-600 font-bold hover:text-white" href="#">진단</a>
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
	<div class="mt-12 h-full">
		<div class="pt-12 mt-12 h-full w-full bg-gray-200" align="center">
			<jsp:include page="${contentPage }"/>
		</div>
	</div>
<footer class="bg-gray-600">
        <p>회사 정보 | 접종 정보 | 이용 약관 | 개인정보 보호 정책 | 연락처 정보</p>
</footer>
</body>
</html>