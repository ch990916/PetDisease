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
	
	function mapSearchEvent(){
		$("#locationInput").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	 var roadAddr = data.roadAddress;
	                document.getElementById("locationInput").value = roadAddr;
		        }
		    }).open();
		})
	}
	
	
	$(function(){
		mapSearchEvent();
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
							var myDt = $("<dt class='font-medium text-gray-900'></dt>").text(b.place_name);
							var myDd = $("<dd class='mt-2 text-sm text-gray-500'></dd>").text(b.address_name);
							var myDiv = $("<div class='border-t border-gray-200 pt-4 pb-4 bg-gray-100 hover:bg-gray-200 rounded-lg'>").append(myDt, myDd).attr("onclick","moveMap("+b.y+","+b.x+");");

							$("#locationCard").append(myDiv);
						})
					}
				})
		})
	})