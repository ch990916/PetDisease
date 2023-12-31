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
			<input value="${post.hp_no }" name="no" type="hidden">
			<tr><td align="right"><fmt:formatDate value="${post.hp_date }" type="both" dateStyle="long" timeStyle="short"/></td></tr>
			<tr><td align="center"><input value="${post.hp_title }" name="noticeTitle" readonly></td></tr>
			<tr><td align="right">작성자 : ${post.hp_writer }</td></tr>
			<tr><td align="center"><textarea placeholder="내용" name="noticeContent" readonly>${post.hp_content }</textarea></td></tr> 			
			</form> 
		</table>
		<table class="snsReplyTable">
			<c:forEach var="p" items="${post.hp_replys }">
				<tr><td>${p.hpr_writer } : ${p.hpr_content }</td></tr>
			</c:forEach>
		</table>
		<c:if test="${sessionScope.user != null }">
		<form name="postReplyWriteForm" action="reply.write" onsubmit="return postReplyWriteCheck();">
		<table class="snsReplyWriteTable">
			<tr><td>${sessionScope.user.hm_id } : <input name="hpr_content"></td><td align="right"><button>작성</button></td></tr>
		</table>
		<input name="hpr_hp_no" value="${post.hp_no }" type="hidden">
		<input name="hpr_writer" value="${sessionScope.user.hm_id }" type="hidden">
		<input name="token" value="${token }" type="hidden">
		<input name="no" value="${post.hp_no }" type="hidden">
		</form>
		</c:if>
	</div>
</body>
</html>