<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<td>
<form name="loginForm" action="login" method="post" onsubmit="return loginCheck();">
<table>
	<tr><td><input name="hm_id" placeholder="id"></td>
	<td id="loginbuttonrow" rowspan="2"><button id="loginButton" class="memberbutton">로그인</button></td></tr>
	<tr><td><input name="hm_pw" placeholder="pw" type="password"></td></tr>
</table>
</form>
</td>
<td><button class="memberbutton" onclick="location.href='join'">회원가입</button>
</tr>
</table>
</body>
</html>