<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>