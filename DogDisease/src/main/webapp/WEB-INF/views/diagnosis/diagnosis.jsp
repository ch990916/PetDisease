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
		<div class="grid grid-cols-2 grid-rows-3">
			<div>
				<form name="diagnosisForm" action="#" onsubmit="return false;" method="post" enctype="multipart/form-data">
					<input name="diagnosis_picture" type="file">
					<button class="p-2 text-xl font-bold hover:text-gray-400 shadow-md">submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>