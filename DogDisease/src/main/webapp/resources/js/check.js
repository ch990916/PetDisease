function joinCheck(){
	var nameField = document.joinForm.pm_name;
	var idField = document.joinForm.pm_id;
	var pwField = document.joinForm.pm_pw;
	var pwckField = document.joinForm.pm_pwck;
	var address1Field = document.joinForm.pm_address1;
	var address2Field = document.joinForm.pm_address2;
	var address3Field = document.joinForm.pm_address3;
	var photoField = document.joinForm.pm_photo;
	
	
	if(emptyCheck(nameField)){
		alert("이름 에러");
		nameField.value = "";
		nameField.focus();		
		return false;
	}
	
	if(emptyCheck(idField) 
			|| subLetterCheck(idField, 4) 
			|| overLetterCheck(idField, 10)
			|| !notContain(idField, /[\W]/g)
			|| $("#joinId").css("color")=="rgb(255, 0, 0)"){
			alert("id에러");
			idField.value = "";
			idField.focus();		
			return false;
		}
	
	if(emptyCheck(pwField) 
			|| subLetterCheck(pwField, 4) 
			|| overLetterCheck(pwField, 10)
			|| notContain(pwField, /[\d]/g)
			|| notContain(pwField, /[\!\@\#\$\%\^\&\*\(\)]/g)
			|| notSame(pwField, pwckField)){
			alert("pw에러");
			pwField.value = "";
			pwField.focus();		
			return false;
		}
	
	
	if(emptyCheck(address1Field) || emptyCheck(address2Field)
			|| emptyCheck(address3Field) || overLetterCheck(address3Field, 50)){
		alert("주소 에러");
		address3Field.value = "";
		address1Field.focus();		
		return false;
	}
	
	if (emptyCheck(photoField)
			|| (notMatchFileType(photoField, "jpg") && notMatchFileType(photoField, "png"))){
			alert("사진 에러");
			photoField.value = "";
			photoField.focus();		
			return false;
		}
	return true;
}

function loginCheck(){
	var idField = document.loginForm.hm_id;
	var pwField = document.loginForm.hm_pw;
	
	if(emptyCheck(idField)){
		alert("id를 입력하세요");
		idField.value = "";
		idField.focus();		
		return false;
	}
	if(emptyCheck(pwField)){
		alert("pw를 입력하세요");
		pwField.value = "";
		pwField.focus();		
		return false;
	}
	return true;
}

function updateCheck(){
	var nameField = document.memberInfoForm.pm_nickname;
	var pwField = document.memberInfoForm.pm_pw;
	var pwckField = document.memberInfoForm.pm_pwck;
	var address1Field = document.memberInfoForm.pm_address1;
	var address2Field = document.memberInfoForm.pm_address2;
	var address3Field = document.memberInfoForm.pm_address3;
	var photoField = document.memberInfoForm.pm_photo;
	
	if(emptyCheck(nameField)){
		alert("이름 에러");
		nameField.value = "";
		nameField.focus();		
		return false;
	}

	if(emptyCheck(pwField) 
			|| subLetterCheck(pwField, 4) 
			|| overLetterCheck(pwField, 10)
			|| notContain(pwField, /[\d]/g)
			|| notContain(pwField, /[\!\@\#\$\%\^\&\*\(\)]/g)
			|| notSame(pwField, pwckField)){
			alert("pw에러");
			pwField.value = "";
			pwField.focus();		
			return false;
		}
	
	
	if(emptyCheck(address1Field) || emptyCheck(address2Field)
			|| emptyCheck(address3Field) || overLetterCheck(address3Field, 50)){
		alert("주소 에러");
		address3Field.value = "";
		address1Field.focus();		
		return false;
	}
	
	if (notMatchFileType(photoField, "jpg") && notMatchFileType(photoField, "png") && !emptyCheck(photoField)){
			alert("사진 에러");
			photoField.value = "";
			photoField.focus();		
			return false;
		}
	return true;
}

function writeCheck(){
	var titleField = document.postWriteForm.pm_name;
	var contentField = document.postWriteForm.pm_pw;
	
	if(emptyCheck(titleField)){
		alert("제목을 입력하세요");
		titleField.value = "";
		titleField.focus();		
		return false;
	}
	
	if(emptyCheck(contentField)){
		alert("내용을 입력하세요");
		contentField.value = "";
		contentField.focus();		
		return false;
	}
	return true;
}

function postReplyWriteCheck(){
	var contentField = document.postReplyWriteForm.pr_content;
	
	if(emptyCheck(contentField)){
		alert("댓글을 입력하세요");
		contentField.value = "";
		contentField.focus();		
		return false;
	}
}
