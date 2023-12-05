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
	$("#hm_address1 , #hm_address2").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	 var roadAddr = data.roadAddress;
	        	document.getElementById('hm_address1').value = data.zonecode;
                document.getElementById("hm_address2").value = roadAddr;
	        }
	    }).open();
	})
}



$(function(){
	revealMenuEvent();
	joinIdKeyEvent();
	addressSearchEvent()
});