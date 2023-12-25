<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="normalArea">
<table><tr><td align="center">
<select id="diseaseClass" class="block font-bold w-100 rounded-md border-0 py-1.5 pl-7 pr-20 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl">
<option value="" disabled selected>선택--------------</option>
<option value="skin">피부</option>
<option value="eye">안구</option>
</select>
<br>
<img id="profilePhoto" class="h-72 w-72 text-gray-300 object-cover bg-gray-200" fill="gray" aria-hidden="true">
<form name="diagnosisPhotoForm">
	<label id="photoLabel" for="pm_photo" class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500 hover:bg-white">
          	<span class="text-2xl">Upload a photo</span>
            <input id="pm_photo" name="pm_photo" type="file" class="sr-only" accept="image/*">
    </label>
    <br><br><hr><br><br>
</form>
</td>
<td align="center"><div id="diagnosisResult" class="p-5 m-20 w-72 h-40 text-2xl"></div></td></tr>
</table>
    <button id="diagnosisBtn" class="inline-flex items-center rounded-md bg-gray-50 px-2 py-1 text-2xl font-medium text-blue-600 ring-1 ring-inset ring-blue-500 font-black">진단하기</button>
</div>
</body>
</html>