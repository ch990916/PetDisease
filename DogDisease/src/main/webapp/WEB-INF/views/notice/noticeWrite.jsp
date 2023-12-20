<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="h-screen">
	<div class="w-6/12 bg-white bg-opacity-25">
		<div class="text-2xl font-bold">공지사항 작성</div>
		<form action="notice.write.reg" name="postWriteForm" onsubmit="return writeCheck();" method="POST">
		<input type="hidden" name="token" value="${token }">
				<div class="mt-2 w-full" align="left">
					<input class="w-full" placeholder="제목" name="pn_title">
				</div>
				<div class="mt-2 w-full" align="left">
					<textarea class="w-full" placeholder="내용" name="pn_content" style="min-height:500px;"></textarea>
				</div>
				<div class="mt-2" align="left">
					<button class="bg-gray-200 hover:bg-gray-600 text-xl text-black text-center font-bold rounded-lg" type="button">등록</button>
				</div>
		</form>
	</div>
</div>
</body>
</html>