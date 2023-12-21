<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="h-screen w-8/12">
		<div class="text-2xl font-bold"">게시물 수정</div>
		<form action="notice.update" onsubmit="return noticeWriteCheck();" method="post">
			<div>
				<input name="pn_no" value="${notice.pn_no }" type="hidden"/>
				<div> 
					<div class="text-sm text-gray-400" align="left">${notice.pm_nickname }&nbsp;<fmt:formatDate value="${notice.pn_date }" type="both" dateStyle="short" timeStyle="short"/></div>
					<input class="mt-2 w-full" name="pn_title" value="${notice.pn_title }"/>
				</div>
				<div class="mt-2 w-full">
					<textarea class="w-full" style="min-height:500px;" name="pn_content">${notice.pn_content }</textarea>
				</div>
				<button class="bg-gray-200 hover:bg-gray-600 text-xl text-black text-center font-bold">수정</button>		
			</div>
		</form>
	</div>
</body>
</html>