<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<c:forEach var="m" items="${members }">
		<tr>
			<td><a href="admin.memberInfo?id=${m.pm_id }">${m.pm_id }</a></td>
			<td>${m.pm_nickname }</td>
			<td>${m.pm_address }</td>
			<td>${m.pm_mail }</td>		
		</tr>
		</c:forEach>

	</table>
</body>
</html>