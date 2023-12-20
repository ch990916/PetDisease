<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="h-screen border-solid border-4 border-black">
		<c:forEach var="m" items="${members }">
		<div class="grid grid-cols-4">
			<div class="col-auto"><a href="admin.memberInfo?id=${m.pm_id }" class="font-bold hover:text-gray-600">${m.pm_id }</a></div>
			<div class="col-auto">${m.pm_nickname }</div>
			<div class="col-auto">${m.pm_address }</div>
			<div class="col-auto">${m.pm_mail }</div>		
		</div>
		</c:forEach>

	</div>
</body>
</html>