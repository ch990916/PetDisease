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
<div class="smallArea">	
		<table id="noticeWriteTable">
			<form id="noticeNo" onsubmit="return noticeDeleteCheck();" action="notice.board.del">
			<input value="${notice.pn_no }" name="no" type="hidden">
			</form>
			<c:if test="${sessionScope.user.pm_admin==4}">
			<tr align="right"><td>
			<button type="submit" form="noticeInfo">수정</button>
			<button type="submit" form="noticeNo">삭제</button>
			</td></tr>
			</c:if>
			<form id="noticeInfo" action="notice.board.modify.go">
				<input value="${notice.pn_no }" name="pn_no" type="hidden">
				<tr><td align="right"><fmt:formatDate value="${notice.pn_date }" type="both" dateStyle="long" timeStyle="short"/></td></tr>
				<tr><td align="center"><input value="${notice.pn_title }" name="pn_title" readonly></td></tr>
				<tr><td align="right">작성자 : ${notice.pm_nickname }</td></tr>
				<tr><td align="center"><textarea placeholder="내용" name="pn_content" readonly>${notice.pn_content }</textarea></td></tr> 			
			</form>
		</table>
	</div>
</body>
</html>