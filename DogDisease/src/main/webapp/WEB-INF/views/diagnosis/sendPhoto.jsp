<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><br><br><br><br>
<form name="diagnosisPhotoForm" onsubmit="return diagnosisPhotoCheck();" action="index" method="get" enctype="multipart/form-data">
	<img id="profilePhoto" style="width: 300px; height: 300px;" class="h-20 w-20 text-gray-300 object-cover bg-gray-200" fill="gray" aria-hidden="true">
	<label id="photoLabel" for="pm_photo" class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500 hover:bg-white">
          	<span class="text-xl">Upload a photo</span>
            <input id="pm_photo" name="pm_photo" type="file" class="sr-only">
    </label>
    <br><br><hr><br><br>
    <button class="inline-flex items-center rounded-md bg-gray-50 px-2 py-1 text-xl font-medium text-blue-600 ring-1 ring-inset ring-blue-500 font-black">진단하기</button>
</table>
</form>
</body>
</html>