<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</head>
<body>
	<div class="grid grid-cols-2 mt-2">
		<div class="col-auto">
			<form action="login" onsubmit="return loginCheck();" method="post">
				<div class="grid grid-cols-2">
					<div>
						<input class="h-6 w-32" style="appearance:none;" name="pm_id" placeholder="Username">
						<input class="mt-1 h-6 w-32" style="appearance:none;" name="pm_pw" placeholder="Password" type="password">
					</div>
					<div>
						<button class="pt-2 text-xl text-white font-bold hover:text-gray-400">로그인</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-auto">
			<button class="pt-2 text-xl text-white font-bold hover:text-gray-400" onclick="location.href='join'">회원가입</button>
		</div>
	</div>
</body>
</html>