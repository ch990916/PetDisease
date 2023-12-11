<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="loginForm" action="login" method="post" onsubmit="return loginCheck();">
<div>
	<div><input name="pm_id" placeholder="id"></div>
	<div><input name="pm_pw" placeholder="pw" type="password"></div>
	<div><button id="loginButton" class="memberbutton">로그인</button>
	</div>
</div>
</form>
		<button class="memberbutton" onclick="location.href='join'">회원가입</button>
</body>
</html>