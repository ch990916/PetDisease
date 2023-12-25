<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="grid grid-cols-2 mt-2">
		<div class="col-auto">
			<button data-modal-target="default-modal" data-modal-toggle="default-modal" class="appearance-none pt-2 text-xl text-black font-bold hover:text-white" type="button">
  			로그인
			</button>
			<div id="default-modal" tabindex="-1" aria-hidden="true" class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-[calc(100%-1rem)] max-h-full">
    			<div class="relative w-full max-w-2xl max-h-full">
        			<div class="relative p w-8/12 bg-white shadow dark:bg-gray-700">
        				<h1 class="m-2 text-2xl font-bold">로그인 페이지</h1>
						<form name="loginForm" action="login" onsubmit="return loginCheck();" method="post">
							<div class="grid grid-rows-2 bg-indigo-100">
								<div class="p-2">
									<p>ID&nbsp;<input class="p-2 h-6 w-32" style="appearance:none;" name="pm_id" placeholder="Username"></p>
									<p>PW&nbsp;<input class="p-2 mt-1 h-6 w-32" style="appearance:none;" name="pm_pw" type="password"></p>
								</div>
								<div class="p-2" align="left">
									<button class="p-2 text-xl text-black font-bold hover:text-white bg-gray-400 rounded-xl shadow-md">로그인</button>
								</div>
							</div>
						</form>	
        			</div>	
    			</div>
			</div>
		</div>
		<div class="col-auto">
			<button class="appearance-none pt-2 text-xl text-black font-bold hover:text-white" onclick="location.href='join'">회원가입</button>
		</div>
	</div>
</body>
</html>