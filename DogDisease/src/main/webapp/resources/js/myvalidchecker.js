function emptyCheck(input){
	return !input.value
}

function subLetterCheck(input, len){
	return input.value.length < len;
}


function overLetterCheck(input, len){
	return input.value.length >= len;
}

function notSame(input1, input2){
	return input1.value != input2.value;
}

function notContain(input, regex){
	if(input.value.match(regex) == null){
		return true;
	}
	return false;
}

function notNum(input){
	return isNaN(input.value) || (input.value.indexOf(" ") != -1);
}

function notMatchFileType(input, type){
	type = "." + type;
	return input.value.toLowerCase().indexOf(type) == -1;
}
