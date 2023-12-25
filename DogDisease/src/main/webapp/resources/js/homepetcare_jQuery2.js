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
		$.getJSON("member.get?pm_id="+id, function(data){
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
	        	document.getElementById("pm_address1").value = data.zonecode;
                document.getElementById("pm_address2").value = roadAddr;
	        }
	    }).open();
	})
}



$(function(){
	revealMenuEvent();
	joinIdKeyEvent();
	addressSearchEvent();
});