<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<div class="h-screen w-4/12">
	<h1 class="text-2xl font-bold">회원정보</h1>
	<div align="right">
	<form action="admin.deleteMember" onsubmit="return deletePostCheck();" method="post">
		<input name="pm_id" value="${member.pm_id }" type="hidden"/>
		<button class="m-2 p-2 rounded-lg font-bold hover:text-white hover:bg-gray-700 shadow-md">회원 탈퇴</button>
	</form>
	</div>
	<div class="mt-8">
	<form action="admin.changeAdmin" onsubmit="return Checkinfo();" method="post">
		<div class="h-auto grid grid-cols-2 grid-rows-auto place-items-start shadow-md">
			<div class="m-2 font-bold">ID :</div>
			<div class="m-2"> ${member.pm_id }</div>
			<div class="m-2 font-bold">닉네임 :</div>
			<div class="m-2"> ${member.pm_nickname }</div>
			<div class="m-2 font-bold">생년월일 :</div>
			<div class="m-2"> <fmt:formatDate value="${member.pm_birthday }"/></div>
			<div class="m-2 font-bold">이메일 :</div>
			<div class="m-2"> ${member.pm_mail }</div>
			<div class="m-2 font-bold">권한</div>
			<div class="m-2">
			<input name="pm_id" type="hidden" value="${member.pm_id }">
			<select name="pm_admin">
				<option value=4 <c:if test="${admin eq 4}">selected="selected"</c:if>>관리자</option>
				<option value=3 <c:if test="${admin eq 3}">selected="selected"</c:if>>일반회원</option>
				<option value=1 <c:if test="${admin eq 1}">selected="selected"</c:if>>글쓰기불가능</option>
				<option value=0 <c:if test="${admin eq 0}">selected="selected"</c:if>>로그인불가능</option>
			</select>
			</div>
			<button class="m-2 p-2 rounded-lg font-bold hover:text-white hover:bg-gray-700 shadow-md">변경사항 적용</button>
		</div>
		</form>
	</div>
</div>
</body>
</html>