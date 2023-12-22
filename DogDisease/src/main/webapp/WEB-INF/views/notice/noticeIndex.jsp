<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="smallArea">
	<h1 class="text-4xl">공지사항</h1>
	<table id="noticeTable">
		<c:if test="${sessionScope.user.pm_admin==4}">
		<tr><td align="right"><button onclick="location.href='notice.write.go'">글쓰기</button></td></tr>
		</c:if>
		<tr><td align="center">
			<table class="noticeIndexTable">
				<tr class="bg-gray-200"><th id="noticeTitleCol">제목</th><th>날짜</th><th>작성자</th></tr>
				<c:forEach var="n" items="${notices }">
					<tr class="bg-gray-100" onclick="location.href='notice.content.go?no=${n.pn_no }'">
					<td>${n.pn_title }</td>
					<td><fmt:formatDate value="${n.pn_date }" type="date" dateStyle="short"/></td>
					<td><img src="resources/userfiles/${n.pm_photo }">${n.pm_nickname }</td></tr>
				</c:forEach>	
			</table>
		</td></tr>
		<tr>
		<td align="center">
			<table>
			 <tr>
			 	<c:forEach var="p" begin="1" end="${pageCount }">
			 	<td><a href="notice.board.change?page=${p }&searchWord=${searchWord }">${p }</a></td>
			 	</c:forEach>
			 	
			 </tr>
			</table>
		</td>			
		</tr>
		<tr>
		<form action="notice.board.search" >
			<td align="center"><input name="searchWord" id="searchInput">
			<button class="inline-flex items-center rounded-md bg-gray-50 px-2 py-1 text-xs font-medium text-gray-600 ring-1 ring-inset ring-gray-500/10 font-black">검색</button></td>
		</form>
		</tr>
	</table>
	</div>
</body>
</html>