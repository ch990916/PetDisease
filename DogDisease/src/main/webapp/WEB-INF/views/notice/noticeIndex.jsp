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

</header>
<body>
<div class="h-screen w-6/12 shadow-md" align="center">
	<div class="grid grid-cols-2">
		<div class="col-auto place-self-start">
			<h1 class="text-4xl font-bold">공지사항</h1>
		</div>
		<div class="place-self-end">
			<c:if test="${sessionScope.user.pm_admin==4}">
				<button class="p-2 font-bold text-xl hover:text-gray-400" onclick="location.href='notice.write'">글쓰기</button>
			</c:if>
		</div>
	</div>
	<div class="table mt-4 w-full border-solid border-2 border-white" align="center">
		<table class="postIndexTable">
			<tr>
				<th>제목</th>
				<th>날짜</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="n" items="${notices }">
				<tr class="pt-4">
					<td class="w-10/12 font-bold hover:text-gray-400"><a href="notice.content.go?pn_no=${n.pn_no }">${n.pn_title }</a></td>
					<td class="w-auto" align="center"><fmt:formatDate value="${n.pn_date }" type="date" dateStyle="short"/></td>
					<td class="w-1/12" align="center">${n.pm_nickname }</td>
				</tr>
			</c:forEach>	
			</table>
		<div>
			<c:forEach var="p" begin="1" end="${pageCount}">
				<div>
					<a href="board.change?page=${p }&searchWord=${searchWord }">${p }</a>
				</div>
	 		</c:forEach>
		</div>		 
		<div class="mt-4"align="right">
			<form action="notice.board.search" >
				<div>
					<input name="searchWord" id="searchInput">
					<button>검색</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>