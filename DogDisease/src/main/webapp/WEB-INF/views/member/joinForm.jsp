<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="h-screen w-4/12">
		<h1 class="text-2xl font-bold">회원가입</h1>
		<div class="mt-8">
		<form name="joinForm" onsubmit="return joinCheck();" action="join.member" method="post" enctype="multipart/form-data">
			<div class="grid grid-cols-2 grid-rows-auto place-items-start shadow-md w-auto h-auto">
				<div class="p-2 text-xl font-bold">ID : </div>
				<div class="p-2"><input name="pm_id"></div>
				<div class="p-2 text-xl font-bold">PW :</div>
				<div class="p-2"><input class="outline-transparent h-8" name="pm_pw" type="password"></div>
				<div class="p-2 text-xl font-bold">PW확인 : </div>
				<div class="p-2"><input class="outline-transparent h-8" name="pm_pwck" type="password"></div>	
				<div class="p-2 text-xl font-bold">닉네임 : </div>
				<div class="p-2"><input name="pm_nickname"></div>
				<div class="p-2 text-xl font-bold">이메일 :</div>
				<div class="p-2"><input name="pm_mail"></div>
				<div class="p-2 text-xl font-bold">생년월일 :</div>
				<div class="p-2"><input style="appearance:none;" name="pm_birthday" type="date"></div>
				<div class="p-2 text-xl font-bold">우편번호 :</div>
				<div class="p-2"><input name="pm_address1" id="pm_address1"></div>	
				<div class="p-2 text-xl font-bold">주소 :</div>
				<div class="p-2"><input name="pm_address2" id="pm_address2"></div>	
				<div class="p-2 text-xl font-bold">상세주소 : </div>
				<div class="p-2"><input name="pm_address3"></div>
				<div class="p-2 text-xl font-bold">사진 :</div>
				<div class="p-2"><input class="p-2" name="pm_photo" type="file"></div>
			</div>
			<div align="right">
			<button class="mt-2 p-2 rounded-lg text-xl font-bold hover:text-white hover:bg-gray-700 shadow-md">가입</button>
			</div>
		</form>
		</div>
</div>
</body>
</html>