<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<div class="smallArea">
<form align="left" class="joinForm" name="memberInfoForm" onsubmit="return memberUpdateCheck();" action="member.update" method="post" enctype="multipart/form-data">
<h1 class="font-bold" id="joinTitle" align="center">
         내 정보
    </h1>
  <div class="space-y-12">
    <div class="border-b border-blue-900 pb-12">

      <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
      
        <div class="sm:col-span-4">
          <label for="pm_nickname" class="block text-xl font-bold leading-6 text-gray-900">닉네임</label>
          <div class="mt-2">
            <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
              <input type="text" name="pm_nickname" id="pm_nickname" value="${sessionScope.user.pm_nickname }" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
            </div>
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_photo" class="block text-xl font-bold leading-6 text-gray-900">프로필 사진</label>
          <div class="mt-2 flex items-center gap-x-3">
            <img id="profilePhoto" src="resources/userfiles/${sessionScope.user.pm_photo }" class="h-12 w-12 text-gray-300" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
            <label id="photoLabel" for="pm_photo" class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500 hover:bg-white">
            <span class="text-xl">Upload a photo</span>
            <input id="pm_photo" name="pm_photo" value="${sessionScope.user.pm_photo }" type="file" class="sr-only">
            </label>
          </div>
        </div>
      </div>
    </div>

    <div class="border-b border-blue-900 pb-12">

      <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
        <div class="sm:col-span-4">
          <label for="pm_id" class="block text-xl font-bold leading-6 text-gray-900">아이디</label>
          <div class="mt-2">
            <input type="text" name="pm_id" id="pm_id" value="${sessionScope.user.pm_id }" readonly class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6 bg-gray-200">
          </div>
        </div>
        
        <div class="sm:col-span-4">
          <label for="pm_pw" class="block text-xl font-bold leading-6 text-gray-900">비밀번호</label>
          <div class="mt-2">
            <input type="password" name="pm_pw" id="pm_pw" value="${sessionScope.user.pm_pw }" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>

        <div class="sm:col-span-4">
          <label for="pm_pwck" class="block text-xl font-bold leading-6 text-gray-900">비밀번호 확인</label>
          <div class="mt-2">
            <input id="pm_pwck" name="pm_pwck" type="password" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
        <br>

        <div class="sm:col-span-4">
          <label for="pm_jumin1" class="block text-xl font-bold leading-6 text-gray-900">생년월일</label>
          <div class="mt-2">
			<input id="pm_jumin1" name="pm_jumin1" type="text" value="<fmt:formatDate value="${sessionScope.user.pm_birthday }" type="date" />" readonly class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6 bg-gray-200">
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_mail" class="block text-xl font-bold leading-6 text-gray-900">메일</label>
          <div class="mt-2">
            <input id="pm_mail" name="pm_mail" type="email" autocomplete="email" value="${sessionScope.user.pm_mail }" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_address1" class="block text-xl font-bold leading-6 text-gray-900">우편번호</label>
          <div class="mt-2">
            <input id="pm_address1" name="pm_address1" readonly autocomplete="email" value="${address1 }" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_address2" class="block text-xl font-bold leading-6 text-gray-900">주소</label>
          <div class="mt-2">
            <input id="pm_address2" name="pm_address2" readonly autocomplete="email" value="${address2 }" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
        
        <div class="col-span-full">
          <label for="pm_address3" class="block text-xl font-bold leading-6 text-gray-900">상세주소</label>
          <div class="mt-2">
            <input id="pm_address3" name="pm_address3" autocomplete="email" value="${address3 }" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="mt-6 flex items-center justify-end gap-x-6">
  	<button type="button" onclick="return withdrawCheck();" class="text-xl font-semibold leading-6 text-gray-900">탈퇴</button>
    <button type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-xl font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">수정</button>
  </div>
=======
<div class="h-full">
	<h1 class="text-2xl font-bold">회원정보&emsp;&emsp;</h1>
	<div class="mt-8">
		<form name="memberInfoForm" onsubmit="return updateCheck();" action="member.update" method="post" enctype="multipart/form-data">
		<div class="w-6/12 h-auto grid grid-cols-2 grid-rows-auto place-items-start shadow-md bg-gray-200">
			<div class="m-2 text-xl font-bold">ID</div>
			<div class="m-2"><input name="pm_id" readonly="readonly" value="${sessionScope.user.pm_id }"></div>
			<div class="m-2 text-xl font-bold">PW</div>
			<div class="m-2"><input name="pm_pw" value="${sessionScope.user.pm_pw }"></div>
			<div class="m-2 text-xl font-bold">PW 확인</div>
			<div class="m-2"><input name="pm_pwck" value="${sessionScope.user.pm_pw }"></div>	
			<div class="m-2 text-xl font-bold">닉네임</div>
			<div class="m-2"><input name="pm_nickname" value="${sessionScope.user.pm_nickname }"></div>
			<div class="m-2 text-xl font-bold">생년월일</div>
			<div class="m-2"><fmt:formatDate value="${sessionScope.user.pm_birthday }" /></div>
			<div class="m-2 text-xl font-bold">우편번호</div>
			<div class="m-2"><input name="pm_address1" value="${address1 }"></div>	
			<div class="m-2 text-xl font-bold">주소</div>
			<div class="m-2"><input name="pm_address2" value="${address2 }"></div>	
			<div class="m-2 text-xl font-bold">상세주소</div>
			<div class="m-2"><input name="pm_address3" value="${address3 }"></div>	
			<div class="m-2 text-xl font-bold">프로필</div>
			<div class="m-2"><img src="resources/userfiles/${sessionScope.user.pm_photo }" style="max-height:100px; max-width:100px;"></div>
			<div class="m-2 text-xl font-bold">프로필 변경</div>
			<div class="m-2"><input name="pm_photo" type="file"></div>
		</div>
			<button class="p-2 rounded-lg text-xl font-bold hover:text-gray-600 block shadow-md">수정</button>
		</form>
		<button class="p-2 rounded-lg text-xl font-bold hover:text-gray-600 block shadow-md" onclick="return deleteCheck();">탈퇴</button>
	</div>
>>>>>>> origin/branch_JinMyeong
</div>
</body>
</html>