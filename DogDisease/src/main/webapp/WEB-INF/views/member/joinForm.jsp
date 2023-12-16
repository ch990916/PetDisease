<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
<div class="areaTable">
	<form name="joinForm" onsubmit="return joinCheck();" action="join.member" method="post" enctype="multipart/form-data">
	<h1 align="center">회원가입</h1>
	<input name="testtt" type="hidden" value="testttttt">
	<table align="center" class="joinForm">
	<tr><th>id</th><td align="center"><input name="pm_id" id="joinId"></td></tr>
	<tr><th>pw</th><td align="center"><input name="pm_pw" type="password"></td></tr>
	<tr><th>pw확인</th><td align="center"><input name="pm_pwck" type="password"></td></tr>	
	<tr><th>닉네임</th><td align="center"><input name="pm_nickname"></td></tr>
	<tr><th>이메일</th><td align="center"><input name="pm_mail"></td></tr>
	<tr><th>생년월일</th><td align="center"><input name="pm_birthday" type="date"></td></tr>
	<tr><th>우편번호</th><td align="center"><input name="pm_address1" id="pm_address1"></td></tr>	
	<tr><th>주소</th><td align="center"><input name="pm_address2" id="pm_address2"></td></tr>	
	<tr><th>상세주소</th><td align="center"><input name="pm_address3" id="pm_address3"></td></tr>
	<tr><th></th><td><div id="wrap"></div></td></tr>	
	<tr><th>사진</th><td align="center"><input name="pm_photo" type="file"></td></tr>
	<tr></tr>
	<tr><td align="center" colspan="2"><button>가입</button></td></tr>
	</table>
	</form>
</div>
</body>
</html>