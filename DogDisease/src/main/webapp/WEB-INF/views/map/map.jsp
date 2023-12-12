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
지도
<table>
<tr><td><div id="map" style="width:500px;height:400px;"></div></td>
<td><div id="roadview" style="width:500px;height:300px;"></div></td></tr>
<tr><td><input id="locationInput"></td>
<td>
<select id="buildingInput">
<option value="병원">병원</option>
<option value="other">other</option>
</select>
</td></tr>
</table>
<table>
<tr id="mainTr"></tr>
</table>

</body>
</html>