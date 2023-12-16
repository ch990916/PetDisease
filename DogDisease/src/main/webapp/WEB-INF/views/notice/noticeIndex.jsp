<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/check.js"></script>
</head>
<header>
	<c:if test="${sessionScope.user.pm_admin==4}">
		<button onclick="location.href='notice.write'">글쓰기</button>
	</c:if>
</header>
<body>
<div class="areaTable">
	<h1>공지사항</h1>
	<table>
		<tr><td align="center">
			<table class="postIndexTable">
				<tr><th>번호</th><th id="titleCol">제목</th><th>날짜</th><th>작성자</th></tr>
				<c:forEach var="n" items="${notices }">
					<tr onclick="location.href='notice.content.go?pn_no=${n.pn_no }'">
						<td>${n.pn_no }</td>
						<td>${n.pn_title }</td>
						<td><fmt:formatDate value="${n.pn_date }" type="date" dateStyle="short"/></td>
						<td><img src="resources/userfiles/${n.pm_photo }">${n.pm_nickname }</td>
					</tr>
				</c:forEach>	
			</table>
		</td></tr>
		<tr>
		<td align="center">
			<table>
			 <tr>
			 	<c:forEach var="p" begin="1" end="${pageCount}">
			 	<td><a href="board.change?page=${p }&searchWord=${searchWord }">${p }</a></td>
			 	</c:forEach>
			 	
			 </tr>
			</table>
		</td>			
		</tr>
		<tr>
		<form action="notice.board.search" >
			<td align="center"><input name="searchWord" id="searchInput">
			<button>검색</button></td>
		</form>
		</tr>
	</table>
	</div>
</body>
</html>