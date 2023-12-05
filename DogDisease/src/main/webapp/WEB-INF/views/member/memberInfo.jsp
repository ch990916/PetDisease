<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
<div class="joinTable">
	<h1 align="center">회원정보&emsp;&emsp;</h1>
	<table class="joinForm" align="center">
	<form  name="memberInfoForm" onsubmit="return updateCheck();" action="member.update" method="post" enctype="multipart/form-data">
	<tr><th>이름</th><td><input name="hm_name" value="${sessionScope.user.hm_name }"></td></tr>
	<tr><th>생년월일</th><td><fmt:formatDate value="${sessionScope.user.hm_birthday }" /></td></tr>
	<tr><th>id</th><td><div name="hm_id">${sessionScope.user.hm_id }</div></td></tr>
	<tr><th>pw</th><td><input name="hm_pw" type="password" value="${sessionScope.user.hm_pw }"></td></tr>
	<tr><th>pw확인</th><td><input name="hm_pwck" type="password" value="${sessionScope.user.hm_pw }"></td></tr>	
	<tr><th>우편번호</th><td><input name="hm_address1" value="${address1 }"></td></tr>	
	<tr><th>주소</th><td><input name="hm_address2" value="${address2 }"></td></tr>	
	<tr><th>상세주소</th><td><input name="hm_address3" value="${address3 }"></td></tr>	
	<tr><th rowspan="2">사진</th><td><img src="resources/userfiles/${sessionScope.user.hm_photo }"></td></tr>
	<tr><td><input name="hm_photo" type="file"></td></tr>
	<tr align="center"><td align="center"><button>수정</button></td>
	</form>
	<td><button onclick="return deleteCheck();">탈퇴</button>
	</td></tr>
	</table>
</div>
</body>
</html>