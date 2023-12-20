<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="grid grid-cols-2">
		<div class="col-auto">
		<form name="loginForm" action="login" method="post" onsubmit="return loginCheck();">
			<div class="grid grid-cols-2">
				<div class="col-auto">
					<input class="h-6 shadow appearance-none border rounded w-full text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="pm_id" type="text" placeholder="Username">
					<input class="h-6 shadow appearance-none border rounded w-full text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="pm_pw" type="password" placeholder="Password">
				</div>
					<button class="text-xl text-white font-bold">로그인</button>
			</div>
		</form>
		</div>
		<div class="col-auto">
			<button class="pt-2 text-xl text-white font-bold" onclick="location.href='join'">회원가입</button>
		</div>
	</div>
</body>
</html>