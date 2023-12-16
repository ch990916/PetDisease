<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="border-solid border-4 border-black">
		<c:forEach var="m" items="${members }">
		<div>
			<a href="admin.memberInfo?id=${m.pm_id }">${m.pm_id }</a>
			${m.pm_nickname }
			${m.pm_address }
			${m.pm_mail }		
		</div>
		</c:forEach>

	</div>
</body>
</html>