<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<div class="smallArea">
<form align="left" class="joinForm" onsubmit="return joinCheck();" action="join.member" method="post" enctype="multipart/form-data">
<h1 class="font-bold" id="joinTitle" align="center">
         회원가입
    </h1>
  <div class="space-y-12">
    <div class="border-b border-blue-900 pb-12">

      <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
      
        <div class="sm:col-span-4">
          <label for="pm_nickname" class="block text-xl font-bold leading-6 text-gray-900">닉네임</label>
          <div class="mt-2">
            <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
              <input type="text" name="pm_nickname" id="pm_nickname" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
            </div>
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_photo" class="block text-xl font-bold leading-6 text-gray-900">프로필 사진</label>
          <div class="mt-2 flex items-center gap-x-3">
            <img id="profilePhoto" class="h-12 w-12 text-gray-300" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
            <label id="photoLabel" for="pm_photo" class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500 hover:bg-white">
            <span class="text-xl">Upload a photo</span>
            <input id="pm_photo" name="pm_photo" type="file" class="sr-only">
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
            <input type="text" name="pm_id" id="pm_id" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
        
        <div class="sm:col-span-4">
          <label for="pm_pw" class="block text-xl font-bold leading-6 text-gray-900">비밀번호</label>
          <div class="mt-2">
            <input type="password" name="pm_pw" id="pm_pw" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>

        <div class="sm:col-span-4">
          <label for="pm_pwck" class="block text-xl font-bold leading-6 text-gray-900">비밀번호 확인</label>
          <div class="mt-2">
            <input id="pm_pwck" name="pm_pwck" type="password" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
        <br>

        <div class="sm:col-span-2">
          <label for="pm_jumin1" class="block text-xl font-bold leading-6 text-gray-900">주민번호</label>
          <div class="mt-2">
			<input id="pm_jumin1" name="pm_jumin1" type="text" maxlength="6" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
        
        <div class="sm:col-span-2">
          <label for="pm_jumin2" class="block text-xl font-medium leading-6 text-gray-900">&nbsp;</label>
          <div class="mt-2">
          	<div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 w-300">
              <input id="pm_jumin2" name="pm_jumin2" type="text" maxlength="1" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
				<span class="flex select-none items-center pl-3 text-gray-500 sm:text-sm">XXXXXX</span>
            </div>		
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_mail" class="block text-xl font-bold leading-6 text-gray-900">메일</label>
          <div class="mt-2">
            <input id="pm_mail" name="pm_mail" type="email" autocomplete="email" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_address1" class="block text-xl font-bold leading-6 text-gray-900">우편번호</label>
          <div class="mt-2">
            <input id="pm_address1" name="pm_address1" readonly autocomplete="email" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>

        <div class="col-span-full">
          <label for="pm_address2" class="block text-xl font-bold leading-6 text-gray-900">주소</label>
          <div class="mt-2">
            <input id="pm_address2" name="pm_address2" readonly autocomplete="email" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
        
        <div class="col-span-full">
          <label for="pm_address3" class="block text-xl font-bold leading-6 text-gray-900">상세주소</label>
          <div class="mt-2">
            <input id="pm_address3" name="pm_address3" autocomplete="email" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl sm:leading-6">
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="mt-6 flex items-center justify-end gap-x-6">
    <button type="submit" class="rounded-md bg-indigo-600 px-3 py-2 text-xl font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">가입</button>
  </div>
</form>
=======
<div class="h-screen w-8/12 bg-white">
		<h1 class="text-2xl font-bold">회원가입</h1>
		<form name="joinForm" onsubmit="return joinCheck();" action="join.member" method="post" enctype="multipart/form-data">
			<div class="m-auto">
				<div class="mt-2 font-bold">id : <input class="h-8 w-4/12 appearance-none" name="pm_id"></div>
				<div class="mt-2 font-bold">pw : <input class="h-8 w-4/12 appearance-none" name="pm_pw" type="password"></div>
				<div class="mt-2 font-bold">pw확인 : <input class="h-8 w-4/12 appearance-none" name="pm_pwck" type="password"></div>	
				<div class="mt-2 font-bold">닉네임 : <input class="h-8 w-4/12 appearance-none" name="pm_nickname"></div>
				<div class="mt-2 font-bold">이메일 : <input class="h-8 w-4/12 appearance-none" name="pm_mail"></div>
				<div class="mt-2 font-bold">생년월일 : <input class="h-8 w-4/12 appearance-none" name="pm_birthday" type="date"></div>
				<div class="mt-2 font-bold">우편번호 : <input class="h-8 w-4/12 appearance-none" name="pm_address1" id="pm_address1"></div>	
				<div class="mt-2 font-bold">주소 : <input class="h-8 w-4/12 appearance-none" name="pm_address2" id="pm_address2"></div>	
				<div class="mt-2 font-bold">상세주소 : <input class="h-8 w-4/12 appearance-none" name="pm_address3"></div>
				<div class="mt-2 font-bold">사진 : <input class="h-8 w-4/12 appearance-none" name="pm_photo" type="file"></div>
				<button class="mt-2">가입</button>
			</div>
		</form>
</div>
>>>>>>> origin/branch_JinMyeong
</body>
</html>