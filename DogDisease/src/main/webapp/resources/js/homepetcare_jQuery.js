function revealMenuEvent(){
	$("#idxBgTblArea").mouseenter(function(){
		$("#idxBgTbl").css("top", "0px");
	})
	$("#idxBgTblArea").mouseleave(function(){
		$("#idxBgTbl").css("top", "-70px");
	})
}


function joinIdKeyEvent(){
	$("#joinId").keyup(function(e){	
		var id = $(this).val();
		$.getJSON("member.get?hm_id="+id, function(data){
			if(data.member[0] == null){
				$("#joinId").css("color", "black");
			} else{
				$("#joinId").css("color", "red");
			}
		})	
	})
}

function addressSearchEvent(){
	$("#pm_address1 , #pm_address2").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	 var roadAddr = data.roadAddress;
	        	document.getElementById('pm_address1').value = data.zonecode;
                document.getElementById("pm_address2").value = roadAddr;
	        }
	    }).open();
	})
}

function photoChangeEvent(){
	$("#pm_photo").change(function(e){
		const preview = new FileReader();
		preview.onload = function(e){
			document.getElementById('profilePhoto').src = e.target.result;
		}
		preview.readAsDataURL(document.getElementById("pm_photo").files[0]);
		
	})
}



$(function(){
	if(document.getElementById('state').value != ""){		
		alert(document.getElementById('state').value);
	}
	revealMenuEvent();
	joinIdKeyEvent();
	addressSearchEvent();
	photoChangeEvent();
	
	$("#diagnosisBtn").click(function(e){
		var imageInput = $("#pm_photo")[0];
		var formData = new FormData();
		formData.append("pm_photo",imageInput.files[0]);
		if(document.getElementById("diseaseClass").value == "skin"){
			$.ajax({
				url : "http://localhost:5000/detect.json",
				type : "POST",
				data : formData,
				dataType : "json",
				contentType : false,
				processData : false,
				success : function(result){
					$("#diagnosisResult").empty();
					var cls = $("<h1 class='mb-10 text-gray-500 font-bold text-3xl'></h1>").text("의심 질병 : ");
					var mySpan1 = $("<span class='font-black text-black text-3xl'></span>").text(result[0].cls);
					cls.append(mySpan1);
					var conf = $("<h1 class='font-bold text-gray-500 text-3xl'></h1>").text("의심도 : ");
					var mySpan2 = null;
					var myColor = null;
					var bar = null;
					if(result[0].conf >= 0.7){
						mySpan2 = $("<span class='text-red-500 font-black text-3xl'></span>").text(result[0].conf);
						bar = $("<progress id='progressRed' align='left' value="+ result[0].conf * 100 + " max='100'></progress>");
					}
					else if(result[0].conf >= 0.3){
						mySpan2 = $("<span class='text-yellow-500 font-black text-3xl'></span>").text(result[0].conf);
						bar = $("<progress id='progressOrange' align='left' value="+ result[0].conf * 100 + " max='100'></progress>");
					}
					else{
						mySpan2 = $("<span class='text-yellow-100 font-black text-3xl'></span>").text(result[0].conf);
						bar = $("<progress id='progressYellow' align='left' value="+ result[0].conf * 100 + " max='100'></progress>");
					}
					conf.append(mySpan2);
					
					
					$("#diagnosisResult").append(cls, conf, bar);
				}
			})		
		}
		if(document.getElementById("diseaseClass").value == "eye"){
			$.ajax({
				url : "http://localhost:5000/predict.do",
				type : "POST",
				data : formData,
				dataType : "json",
				contentType : false,
				processData : false,
				success : function(result){
					$("#diagnosisResult").empty();
					var cls = $("<h1 class='mb-10 text-gray-500 font-bold'></h1>").text("의심 질병 : ");
					var mySpan1 = $("<span class='font-black text-black'></span>").text(result.name);
					cls.append(mySpan1);
					var conf = $("<h1 class='font-bold text-gray-500'></h1>").text("의심도 : ");
					var mySpan2 = null;
					var myColor = null;
					var bar = null;
					if(result.conf >= 0.7){
						mySpan2 = $("<span class='text-red-500 font-black'></span>").text(Math.round(result.conf * 100)/100);
						bar = $("<progress id='progressRed' align='left' value="+ result.conf * 100 + " max='100'></progress>");
					}
					else if(result.conf >= 0.3){
						mySpan2 = $("<span class='text-yellow-500 font-black'></span>").text(Math.round(result.conf * 100)/100);
						bar = $("<progress id='progressOrange' align='left' value="+ result.conf * 100 + " max='100'></progress>");
					}
					else{
						mySpan2 = $("<span class='text-yellow-100 font-black'></span>").text(Math.round(result.conf * 100)/100);
						bar = $("<progress id='progressYellow' align='left' value="+ result.conf * 100 + " max='100'></progress>");
					}
					conf.append(mySpan2);
					
					
					$("#diagnosisResult").append(cls, conf, bar);
				}
			})		
		}
		
			
	});
});