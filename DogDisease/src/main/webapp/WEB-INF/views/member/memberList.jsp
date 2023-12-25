<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</head>
<body>
<div class="smallArea">
	<h1 class="font-bold" id="joinTitle" align="center">회원 목록</h1>
	<div class="space-y-12">
		<div class="mt-2">
		<table class="w-full shadow-lg">
			<tr class="mb-4 h-auto border border-slate-300">
				<td class="p-2 text-xl font-bold">ID</td>
				<td class="p-2 text-xl font-bold">권한</td>
				<td class="p-2 text-xl font-bold">닉네임</td>
				<td class="p-2 text-xl font-bold">이메일</td>
			</tr>
				<c:forEach var="m" items="${members }">
					<tr class="mb-2 h-auto">
						<td class="p-2 border border-slate-300"><a href="admin.memberInfo?id=${m.pm_id }" class="font-bold hover:text-gray-400">${m.pm_id }</a></td>
						<td class="p-2 border border-slate-300">
							<c:choose>
								<c:when test="${m.pm_admin == 4}">관리자</c:when> 
								<c:when test="${m.pm_admin == 3}">일반회원</c:when> 
								<c:when test="${m.pm_admin == 1}">글쓰기불가능</c:when> 
								<c:when test="${m.pm_admin == 0}">로그인불가능</c:when> 
							</c:choose>
						</td>
						<td class="p-2 border border-slate-300">${m.pm_nickname }</td>
						<td class="p-2 border border-slate-300">${m.pm_mail }</td>		
					</tr>
				</c:forEach>
		</table>
		</div>
	</div>
</div>

</body>
</html>