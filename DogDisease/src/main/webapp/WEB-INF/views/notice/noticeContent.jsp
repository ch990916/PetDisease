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
<div class="areaTable">	
		<table id="postWriteTable">
			<form name="noticeUpdateForm" onsubmit="return noticeUpdateCheck();" method="POST">
			<input value="${notice.pn_no }" name="no" type="hidden">
			<tr><td align="right"><fmt:formatDate value="${notice.pn_date }" type="both" dateStyle="long" timeStyle="short"/></td></tr>
			<tr><td align="center"><input value="${notice.pn_title }" name="noticeTitle" readonly></td></tr>
			<tr><td align="right">작성자 : ${notice.pm_nickname }</td></tr>
			<tr><td align="center"><textarea placeholder="내용" name="noticeContent" readonly>${notice.pn_content }</textarea></td></tr> 			
			</form> 
		</table>
	</div>
</body>
</html>