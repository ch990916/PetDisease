<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
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
<div class="smallArea">
<h1 class="font-bold" id="joinTitle" align="center">회원 정보</h1>
	<div class="space-y-12">
		<div class="border-b border-blue-900 pb-12">
			<div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
				<div class="sm:col-span-4">
					<label class="block text-xl font-bold leading-6 text-gray-900">닉네임</label>
					<div class=:mt-2">
						<div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 fucus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
							<div class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 sm:text-xl sm:leading-6 bg-white">${member.pm_nickname }</div>
					</div>
				</div>
				</div>
				<div class="col-span-full">
					<label class="block text-xl font-bold leading-6 text-gray-900">프로필 사진</label>
					<div class="mt-2 flex items-center gap-x-3">
						<img id="profilePhoto" src="resources/userfiles/${member.pm_photo }" style="max-height:100px; max-width:100px;" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"/>
					</div>
				</div>
			</div>
		</div>
	
		<div class="border-b border-blue-900 pb-12">
			<div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
				<div class="sm:col-span-4">
					<label class="block text-xl font-bold leading-6 text-gray-900">아이디</label>
					<div class="mt-2">
						<div class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6 bg-gray-200">${member.pm_id }</div>
					</div>
				</div>
				<div class="sm:col-span-4">
					<label class="block text-xl font-bold leading-6 text-gray-900">생년월일</label>
					<div class="mt-2">
						<div class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6 bg-gray-200">
							<fmt:formatDate value="${member.pm_birthday }" type="date"/>
						</div>
					</div>
				</div>
				<div class="sm:col-span-4">
					<label class="block text-xl font-bold leading-6 text-gray-900">이메일</label>
					<div class="mt-2">
						<div class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6 bg-gray-200">
							${member.pm_mail }
						</div>
					</div>
				</div>
				<div class="sm:col-span-4">
					<label class="block text-xl font-bold leading-6 text-gray-900">권한</label>
					<form action="admin.changeAdmin" onsubmit="return Checkinfo();" method="post">		
						<input name="pm_id" type="hidden" value="${member.pm_id }">
						<select name="pm_admin">
							<option value=4 <c:if test="${member.pm_admin eq 4}">selected="selected"</c:if>>관리자</option>
							<option value=3 <c:if test="${member.pm_admin eq 3}">selected="selected"</c:if>>일반회원</option>
							<option value=1 <c:if test="${member.pm_admin eq 1}">selected="selected"</c:if>>글쓰기불가능</option>
							<option value=0 <c:if test="${member.pm_admin eq 0}">selected="selected"</c:if>>로그인불가능</option>
						</select>
						<button class="rounded-md bg-indigo-600 px-3 py-2 text-xl font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">변경사항 적용</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<form action="admin.deleteMember" onsubmit="return deletePostCheck();" method="post">
		<input name="pm_id" value="${member.pm_id }" type="hidden"/>
		<button class="mt-2 text-xl font-semibold leading-6 text-gray-900 hover:text-gray-600">회원 탈퇴</button>
	</form>
</div>
</body>
</html>