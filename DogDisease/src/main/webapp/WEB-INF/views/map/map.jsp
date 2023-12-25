<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/kakaoMap.js"></script>
<script type="text/javascript" src="resources/js/mapJQuery.js"></script>
</head>
<body>
<div class="normalArea">
<h1 class="text-5xl font-black">주변 검색</h1>
<table align="center" style="margin-top:30px;">
<tr><td><div id="map" style="width:500px;height:400px;"></div></td>
<td><div id="roadview" style="width:500px;height:300px;"></div></td></tr>
<tr><td><input id="locationInput" class="block w-100 rounded-md border-0 py-1.5 pl-7 pr-20 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl"></td>
<td>
<select id="buildingInput" class="block w-100 rounded-md border-0 py-1.5 pl-7 pr-20 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-xl font-bold">
<option value="" disabled selected>선택--------------</option>
<option value="동물병원">동물병원</option>
<option value="펫샵">펫샵</option>
</select>
</td></tr>
</table>
<dl id="locationCard" class="mt-16 grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-4 m-3 sm:gap-y-16 lg:gap-x-8 text-xl">
</dl>



</div>

</body>
</html>