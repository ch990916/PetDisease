<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="grid grid-cols-2 grid-rows-2 place-items-center col-gap-0">
		<div class="row-span-full place-self-end h-auto w-auto pb-2 pr-2">
			<img src="resources/userfiles/${sessionScope.user.pm_photo }" style="max-height:50px; max-width:50px;">
		</div>
		<div>
			<span class="font-bold">${sessionScope.user.pm_nickname }</span>님 반갑습니다.
		</div>
		<div>
			<a class="px-2 font-bold hover:text-white" href="memberInfo">회원정보</a>
			<a class="px-2 font-bold hover:text-white" href="logout">로그아웃</a>
		</div>
	</div>
</body>
</html>