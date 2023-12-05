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
	<form action="upload.exec" onsubmit="return uploadCheck(this);" method="post" enctype="multipart/form-data">

		<table id="postWriteTable">
			<tr><td align="center"><input placeholder="제목" name="hd_title"></td></tr>
			<tr><td align="center"><input type="file" name="hd_file"></td></tr>
			<tr><td align="center"><button>업로드</button></td></tr>
		</table>
	</form>
	</div>
</body>
</html>