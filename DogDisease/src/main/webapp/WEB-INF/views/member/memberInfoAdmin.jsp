<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function Checkinfo(){
		if(Confirm("권한을 수정하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
</script>
</head>
<body>
	<c:forEach var="m" items="${members }">
	<div>ID : ${m.pm_id }</div>
	<div>닉네임 : ${m.pm_nickname }</div>
	<div>생년월일 : ${m.pm_birthday }</div>
	<div>이메일 : ${m.pm_mail }</div>
	</c:forEach>
	<div>권한</div>
	<form action="admin.changeAdmin" onsubmit="return Checkinfo();" method="post">
	<div>
		<c:forEach var="m" items="${members }">
		<c:set var="admin" value="${m.pm_admin }"/>
		<input name="pm_id" type="hidden" value="${m.pm_id }">
		<select name="pm_admin">
			<option value=4 <c:if test="${admin eq 4}">selected="selected"</c:if>>관리자</option>
			<option value=3 <c:if test="${admin eq 3}">selected="selected"</c:if>>일반회원</option>
			<option value=1 <c:if test="${admin eq 1}">selected="selected"</c:if>>글쓰기불가능</option>
			<option value=0 <c:if test="${admin eq 0}">selected="selected"</c:if>>로그인불가능</option>
		</select>
		</c:forEach>
	</div>
	<button>변경사항 적용</button>
	</form>
	<button>회원 탈퇴</button>
</body>
</html>