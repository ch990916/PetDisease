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
<div class="areaTable">
	<h1>자료실</h1>
	<table>
		<tr><td align="right"><button onclick="location.href='upload.go'">파일 등록</button></td></tr>
		<tr><td align="center">
			<table class="postIndexTable">
				<tr><th id="titleCol">제목</th><th>날짜</th><th>작성자</th></tr>
				<c:forEach var="p" items="${posts }">
					<tr onclick="location.href='post.content.go?no=${p.hp_no }'"><td>${p.hp_no }</td>
					<td>${p.hp_title }</td>
					<td><fmt:formatDate value="${p.hp_date }" type="date" dateStyle="short"/></td>
					<td><img src="resources/userfiles/${p.hm_photo }">${p.hp_writer }</td></tr>
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
		<form action="" >
			<td align="center"><input name="searchWord" id="searchInput">
			<button>검색</button></td>
		</form>
		</tr>
	</table>
	</div>
</body>
</html>