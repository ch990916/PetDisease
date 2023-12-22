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
});