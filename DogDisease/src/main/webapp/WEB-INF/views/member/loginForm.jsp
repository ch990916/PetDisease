<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
	<div class="bg-gray-200 grid grid-cols-2">
		<div class="bg-gray-300 col-auto">
		<form name="loginForm" action="login" method="post" onsubmit="return loginCheck();">
			<div>
				<input name="pm_id" placeholder="id">
				<input name="pm_pw" placeholder="pw" type="password">
				<button id="loginButton" class="memberbutton">로그인</button>
			</div>
		</form>
		</div>
		<div class="col-auto">
			<button class="memberbutton" onclick="location.href='join'">회원가입</button>
		</div>
	</div>
</body>
</html>