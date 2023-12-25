<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
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
=======
<script type="text/javascript" src="resources/js/check.js"></script>
</head>
<body>
	<div class="h-screen w-8/12">	
		<div>
			<div class="text-2xl font-bold" align="left">
				${notice.pn_title }

			</div>
			<div class="text-sm text-gray-400" align="left">
				${notice.pm_nickname }&nbsp;<fmt:formatDate value="${notice.pn_date }" type="both" dateStyle="short" timeStyle="short"/>
			</div>
			<div class="pt-4 pl-4 bg-white bg-opacity-50" style="min-height:550px;" align="left">
				${notice.pn_content }
			</div>		
		</div>
		<c:if test="${sessionScope.user.pm_admin == 4}">
		<div align="left">
			<div class="grid grid-cols-2">
				<div class="col-auto">
					<form action="notice.update.go" method="post">
						<div>
							<input value="${notice.pn_no }" name="pn_no" type="hidden">
							<button class="p-2 text-xl font-bold hover:text-gray-400">update</button>
						</div>
					</form>
				</div>
				<div class="col-auto">
					<form action="notice.delete" onsubmit="return deletePostCheck();" method="post">
						<div>
							<input value="${notice.pn_no }" name="pn_no" type="hidden">
							<button class="p-2 text-xl font-bold hover:text-gray-400">delete</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		</c:if>
>>>>>>> origin/branch_JinMyeong
	</div>
</body>
</html>