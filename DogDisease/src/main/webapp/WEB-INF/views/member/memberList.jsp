<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="h-screen">
		<h1 class="text-2xl font-bold">회원 목록</h1>
		<table class="border-collapse border border-slate-400 mt-10 min-h-4/6 shadow-lg">
			<tr class="mb-4 h-auto">
				<td class="p-2 w-4/12 text-xl font-bold">ID</td>
				<td class="p-2 w-4/12 text-xl font-bold">닉네임</td>
				<td class="p-2 w-4/12 text-xl font-bold">이메일</td>
			</tr>
				<c:forEach var="m" items="${members }">
					<tr class="mb-2 h-auto">
						<td class="p-2 border border-slate-300"><a href="admin.memberInfo?id=${m.pm_id }" class="font-bold hover:text-gray-400">${m.pm_id }</a></td>
						<td class="p-2 border border-slate-300">${m.pm_nickname }</td>
						<td class="p-2 border border-slate-300">${m.pm_mail }</td>		
					</tr>
				</c:forEach>
		</table>
	</div>
</body>
</html>