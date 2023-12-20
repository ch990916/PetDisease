<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="notice.update" onsubmit="return writeCheck();" method="post">
		<div>
			<input name="pn_no" value="${notice.pn_no }" type="hidden"/>
			<div> 
				작성자 : ${notice.pm_nickname }
				<input name="pn_title" value="${notice.pn_title }"/>
				<fmt:formatDate value="${notice.pn_date }" type="both" dateStyle="long" timeStyle="short"/>
			</div>
			<div>
				<textarea name="pn_content">${notice.pn_content }</textarea>
			</div>
			<button>submit</button>		
		</div>
	</form>
</body>
</html>