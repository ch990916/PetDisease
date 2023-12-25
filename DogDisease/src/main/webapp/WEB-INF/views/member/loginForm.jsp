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
	<tr><td><input name="pm_id" placeholder="id" class="text-black"></td>
	<tr><td><input name="pm_pw" placeholder="pw" type="password" class="text-black"></td></tr>
</table>
</td>
<td>
<table align="center"><tr>
<td align="center"><button type="submit" id="loginButton" class="inline-flex items-center rounded-md bg-gray-50 px-2 py-1 text-sm font-medium text-gray-600 ring-1 ring-inset ring-gray-500 font-black w-90">로그인</button></td>
</tr><tr>
<td align="center"><button type="button" class="inline-flex items-center rounded-md bg-gray-50 px-2 py-1 text-sm font-medium text-gray-600 ring-1 ring-inset ring-gray-500 font-black" onclick="location.href='join'">회원가입</button></td>
</tr></table>
</form>
</tr>
</table>
</body>
</html>