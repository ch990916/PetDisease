<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="h-screen w-8/12 bg-white">
		<h1 class="text-2xl font-bold">회원가입</h1>
		<form name="joinForm" onsubmit="return joinCheck();" action="join.member" method="post" enctype="multipart/form-data">
			<div class="m-auto">
				<div class="mt-2 font-bold">id : <input class="h-8 w-4/12 appearance-none" name="pm_id"></div>
				<div class="mt-2 font-bold">pw : <input class="h-8 w-4/12 appearance-none" name="pm_pw" type="password"></div>
				<div class="mt-2 font-bold">pw확인 : <input class="h-8 w-4/12 appearance-none" name="pm_pwck" type="password"></div>	
				<div class="mt-2 font-bold">닉네임 : <input class="h-8 w-4/12 appearance-none" name="pm_nickname"></div>
				<div class="mt-2 font-bold">이메일 : <input class="h-8 w-4/12 appearance-none" name="pm_mail"></div>
				<div class="mt-2 font-bold">생년월일 : <input class="h-8 w-4/12 appearance-none" name="pm_birthday" type="date"></div>
				<div class="mt-2 font-bold">우편번호 : <input class="h-8 w-4/12 appearance-none" name="pm_address1" id="pm_address1"></div>	
				<div class="mt-2 font-bold">주소 : <input class="h-8 w-4/12 appearance-none" name="pm_address2" id="pm_address2"></div>	
				<div class="mt-2 font-bold">상세주소 : <input class="h-8 w-4/12 appearance-none" name="pm_address3"></div>
				<div class="mt-2 font-bold">사진 : <input class="h-8 w-4/12 appearance-none" name="pm_photo" type="file"></div>
				<button class="mt-2">가입</button>
			</div>
		</form>
</div>
</body>
</html>