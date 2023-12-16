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
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.1/dist/tailwind.min.css" rel="stylesheet">
</head>
<header class="py-5">
	<c:if test=""></c:if>
		<a href="board.write">글 쓰기</a>
</header>
<body>
<div>
	<h1>SNS Page</h1>
		<c:forEach var="p" items="${posts }">
			<div class="py-5">
					<div>
						<img src="resources/userfiles/${p.pm_photo }" alt="${p.pm_photo }"/>
						${p.pm_nickname } / ${p.pp_date }
						<p>${p.pp_content }</p>
						<img src="resources/post/${p.pp_picture }" alt="${p.pp_picture}"/>
					</div>
				<form action="post.delete" onsubmit="return deleteCheck()" method="post">
						<input name="pp_no" type="hidden" value="${p.pp_no }"/>
						<input name="pp_picture" type="hidden" value="${p.pp_picture }"/>
						<button>delete</button>
				</form>
				<button onclick="">show reply</button>
			</div>
		</c:forEach>
	</div>
</body>
</html>