<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="loginCompleteTable">
		<tr><td rowspan="2"><img src="resources/userfiles/${sessionScope.user.pm_photo }"></td>
		<td colspan="2">ADMIN ${sessionScope.user.pm_nickname }님 반갑습니다.</td></tr>
		<tr><td><a href="admin.memberlist">회원관리</a></td>
		<td id="logoutTd"><a href="logout">로그아웃</a></td></tr>
	</table>
</body>
</html>