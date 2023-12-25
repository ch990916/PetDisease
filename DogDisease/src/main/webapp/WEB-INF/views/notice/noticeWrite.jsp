<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
</head>
<body>
<div class="smallArea">
	<form action="notice.write.reg" name="noticeWriteForm" onsubmit="return noticeWriteCheck();" method="POST">
	<input type="hidden" name="token" value="${token }" readonly="true">
		<table id="postWriteTable">
			<tr><td align="center"><input placeholder="제목" name="pn_title"></td></tr>
			<tr><td align="center"><textarea placeholder="내용" name="pn_content"></textarea></td></tr>
			<tr><td align="center"><button>등록</button></td></tr>
		</table>
	</form>
	</div>
=======
<script type="text/javascript">
	$(function(){
		loadingCheck();
	});
</script>
</head>
<body>
<div class="h-screen">
	<div class="w-6/12 bg-white bg-opacity-25">
		<div class="text-2xl font-bold">공지사항 작성</div>
		<form action="notice.write.reg" name="noticeWriteForm" onsubmit="return noticeWriteCheck();" method="POST">
			<input type="hidden" name="token" value="${token }">
			<div class="mt-2 w-full" align="left">
				<input class="w-full" placeholder="제목" name="pn_title">
			</div>
			<div class="mt-2 w-full" align="left">
				<textarea class="w-full" placeholder="내용" name="pn_content" style="min-height:500px;"></textarea>
			</div>
			<div class="mt-2" align="left">
				<button class="bg-gray-200 hover:bg-gray-600 text-xl text-black text-center font-bold">등록</button>
			</div>
		</form>
	</div>
</div>
>>>>>>> origin/branch_JinMyeong
</body>
</html>