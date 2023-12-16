<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/check.js"></script>
</head>
<body>
	<div>	
		<div>
			<div>
				작성자 : ${notice.pm_nickname }
				${notice.pn_title }
				<fmt:formatDate value="${notice.pn_date }" type="both" dateStyle="long" timeStyle="short"/>
			</div>
			<div>
				${notice.pn_content }
			</div>		
		</div>
		<c:if test="${sessionScope.user.pm_admin == 4}">
			<form action="notice.update.go" method="post">
				<div>
					<input value="${notice.pn_no }" name="pn_no" type="hidden">
					<button>update</button>
				</div>
			</form>
			<form action="notice.delete" onsubmit="return deleteCheck();" method="post">
				<div>
					<input value="${notice.pn_no }" name="pn_no" type="hidden">
					<button>delete</button>
				</div>
			</form>
		</c:if>
	</div>
</body>
</html>