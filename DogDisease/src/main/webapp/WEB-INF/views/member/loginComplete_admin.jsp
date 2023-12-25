<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</head>
<body>
	<div class="grid grid-cols-2 mt-2">
		<div class="col-auto h-auto w-auto mr-2 place-self-end">
			<img src="resources/userfiles/${sessionScope.user.pm_photo }" style="max-height:60px; max-width:60px;">
		</div>
		<div>
			<p class="place-self-start">ADMIN&nbsp;<span class="font-bold">${sessionScope.user.pm_nickname }</span>님 반갑습니다.</p>
			<a class="px-2 font-bold hover:text-white place-self-start" href="admin.memberlist">회원관리</a>
			<a class="px-2 font-bold hover:text-white" href="memberInfo">회원정보</a>
			<a class="px-2 font-bold hover:text-white place-self-start" href="logout">로그아웃</a>
		</div>
	</div>
</body>
</html>