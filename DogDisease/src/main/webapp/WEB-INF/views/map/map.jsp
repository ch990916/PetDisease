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
	<div class="h-screen">
		<div class="grid grid-cols-2 grid-rows-3 bg-indigo">
			<div class="col-auto row-auto place-self-end" id="map" style="width:500px; height:400px;"></div>
			<div class="col-auto row-auto place-self-start" id="roadview" style="width:500px; height:400px;"></div>
			<div class="mt-2 col-span-2 row-auto place-items-middle">
				<input id="locationInput">
				<select id="buildingInput">
					<option value="" disabled="disabled" selected="selected">---항목선택---</option>
					<option value="동물병원">동물병원</option>
					<option value="펫샵">펫샵</option>
				</select>
			</div>
			<div class="mt-2 col-span-2 grid grid-cols-2 grid-rows-auto" id="locationCard">
			</div>
		</div>
	</div>
</body>
</html>