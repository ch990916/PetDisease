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
<div class="h-screen w-8/12">
	<h1 class="text-2xl font-bold">회원정보&emsp;&emsp;</h1>
	<div class="w-8/12">
		<form name="memberInfoForm" onsubmit="return updateCheck();" action="member.update" method="post" enctype="multipart/form-data">
			<div>닉네임 : <input name="pm_nickname" value="${sessionScope.user.pm_nickname }"></div>
			<div>생년월일 : <fmt:formatDate value="${sessionScope.user.pm_birthday }" /></div>
			<div>id : <div name="pm_id">${sessionScope.user.pm_id }</div></div>
			<div>pw : <input name="pm_pw" value="${sessionScope.user.pm_pw }"></div>
			<div>pw확인 : <input name="pm_pwck" value="${sessionScope.user.pm_pw }"></div>	
			<div>우편번호 : <input name="pm_address1" value="${address1 }"></div>	
			<div>주소 : <input name="pm_address2" value="${address2 }"></div>	
			<div>상세주소 : <input name="pm_address3" value="${address3 }"></div>	
			<div>사진 : <img src="resources/userfiles/${sessionScope.user.pm_photo }" style="max-height:100px; max-width:100px;"></div>
			<div><input name="pm_photo" type="file"></div>
			<button>수정</button>
		</form>
		<button onclick="return deleteCheck();">탈퇴</button>
	</div>
</div>
</body>
</html>