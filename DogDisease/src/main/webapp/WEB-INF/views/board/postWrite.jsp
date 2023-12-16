<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/check.js"></script>
</head>
<body>
<div>
	<form action="write.post" name="postWriteForm" onsubmit="return WriteCheck();" method="post" enctype="multipart/form-data">
	<input type="hidden" name="token" value="${token }">
		<div>
			<input name="pp_picture" type="file">
			<textarea name="pp_content" placeholder="규정에 위반되는 글은 예고없이 삭제될 수 있습니다."></textarea>
			<button>등록</button>
		</div>
	</form>
</div>
</body>
</html>