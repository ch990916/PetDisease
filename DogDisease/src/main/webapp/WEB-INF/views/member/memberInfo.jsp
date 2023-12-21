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
<div class="h-full">
	<h1 class="text-2xl font-bold">회원정보&emsp;&emsp;</h1>
	<div class="mt-12">
		<form name="memberInfoForm" onsubmit="return updateCheck();" action="member.update" method="post" enctype="multipart/form-data">
		<div class="w-6/12 h-auto grid grid-cols-2 grid-rows-10 place-items-start shadow-md bg-gray-200">
			<div class="text-xl font-bold">ID</div>
			<div><input name="pm_id" readonly="readonly" value="${sessionScope.user.pm_id }"></div>
			<div class="text-xl font-bold">PW</div>
			<div><input name="pm_pw" value="${sessionScope.user.pm_pw }"></div>
			<div class="text-xl font-bold">PW 확인</div>
			<div><input name="pm_pwck" value="${sessionScope.user.pm_pw }"></div>	
			<div class="text-xl font-bold">닉네임</div>
			<div><input name="pm_nickname" value="${sessionScope.user.pm_nickname }"></div>
			<div class="text-xl font-bold">생년월일</div>
			<div><fmt:formatDate value="${sessionScope.user.pm_birthday }" /></div>
			<div class="text-xl font-bold">우편번호</div>
			<div><input name="pm_address1" value="${address1 }"></div>	
			<div class="text-xl font-bold">주소</div>
			<div><input name="pm_address2" value="${address2 }"></div>	
			<div class="text-xl font-bold">상세주소</div>
			<div><input name="pm_address3" value="${address3 }"></div>	
			<div class="text-xl font-bold">프로필</div>
			<div><img src="resources/userfiles/${sessionScope.user.pm_photo }" style="max-height:100px; max-width:100px;"></div>
			<div class="text-xl font-bold">프로필 변경</div>
			<div><input name="pm_photo" type="file"></div>
		</div>
			<button class="p-2 rounded-lg text-xl font-bold hover:text-gray-600 block shadow-md">수정</button>
		</form>
		<button class="p-2 rounded-lg text-xl font-bold hover:text-gray-600 block shadow-md" onclick="return deleteCheck();">탈퇴</button>
	</div>
</div>
</body>
</html>