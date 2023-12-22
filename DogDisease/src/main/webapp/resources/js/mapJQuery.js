var map = null;
	var marker = null;
	var roadviewClient = null;
	function drawMap(latitude, longitude){
		var center = new kakao.maps.LatLng(latitude, longitude);
		var container = document.getElementById('map');
		var options = { 
			center: center,
			level: 3
		}
		map = new kakao.maps.Map(container, options);
		marker = new kakao.maps.Marker({
		    map: map,
		    position: center
		});
		marker.setMap(map);
		
		var container2 = document.getElementById('roadview');
		var roadview = new kakao.maps.Roadview(container2);
		roadviewClient = new kakao.maps.RoadviewClient();
		roadviewClient.getNearestPanoId(center, 50, function(panoId) {
		    roadview.setPanoId(panoId, center);
		});
	}
	
	function moveMap(latitude, longitude){
		var center = new kakao.maps.LatLng(latitude, longitude);
		map.setCenter(center);
		marker.setPosition(center);
		var container2 = document.getElementById('roadview');
		var roadview = new kakao.maps.Roadview(container2);
		roadviewClient.getNearestPanoId(center, 500, function(panoId) {
		    roadview.setPanoId(panoId, center);
		});
	}
	
	
	$(function(){
		navigator.geolocation.getCurrentPosition(function(loc){
			var latitude = loc.coords.latitude;		
			var longitude = loc.coords.longitude;		
			drawMap(latitude, longitude);			
		});
		
		$("#locationInput").keyup(function(e){
			if(e.keyCode == 13){
				var search = $("#locationInput").val();
				$.ajax({
					url : "https://dapi.kakao.com/v2/local/search/address",
					data : {"query" : search},
					beforeSend: function (before) {
			            before.setRequestHeader("Authorization","KakaoAK 1ddaafaa30e0117ca72585e7030f5477");
			        },
					success : function(result){
						var longitude = result.documents[0].x;
						var latitude = result.documents[0].y;
						moveMap(latitude, longitude);
					}
				})
			}
		})
		
		$("#buildingInput").change(function(e){
				var search = $("#buildingInput").val();
				$.ajax({
					url : "https://dapi.kakao.com/v2/local/search/keyword",
					data : {"query" : search,
						"x": map.getCenter().getLng(),
						"y": map.getCenter().getLat(),
						"radius": "1000"},
					beforeSend: function (before) {
			            before.setRequestHeader("Authorization","KakaoAK 1ddaafaa30e0117ca72585e7030f5477");
			        },
					success : function(result){
						$("#locationCard").empty();
						$.each(result.documents, function(i, b){
							var nameTd = $("<div class='font-bold hover:text-gray-400'></div>").text(b.place_name);
							var nameTr = $("<div class='nameTd bg-indigo-400'></div>").append(nameTd);
							var addrTd = $("<div class='text-sm'></div>").text(b.address_name);
							var addrTr = $("<div class='addrTd' bg-purple-400></div>").append(addrTd);
							var table = $("<div class='grid grid-cols-4 grid-rows-auto m-2 bg-white'></div>").append(nameTr, addrTr).attr("onclick","moveMap("+b.y+","+b.x+");");
							var subTd = $("<div class='subTd'></div>").append(table);
							$("#locationCard").append(subTd);
							if(i % 5 == 4){
								$("#locationCard").append("<br>");
							}
						})
					}
				})
		})
	})