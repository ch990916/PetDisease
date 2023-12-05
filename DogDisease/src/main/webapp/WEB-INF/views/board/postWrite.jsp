<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="areaTable">
	<form action="write.post" name="postWriteForm" onsubmit="return writeCheck();" method="POST">
	<input type="hidden" name="token" value="${token }" readonly="true">
		<table id="postWriteTable">
			<tr><td align="center"><input placeholder="제목" name="hp_title"></td></tr>
			<tr><td align="center"><textarea placeholder="내용" name="hp_content"></textarea></td></tr>
			<tr><td align="center"><button>등록</button></td></tr>
		</table>
	</form>
	</div>
</body>
</html>