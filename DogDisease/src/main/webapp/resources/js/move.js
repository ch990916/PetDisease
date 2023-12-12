function withdrawCheck(){
	confirm("탈퇴하시겠습니까?");
	return location.href="deleteMember";
}

function modifyNotice(){
	return location.href="notice.board.modify.go";
}

function noticeDeleteCheck(){
	confirm("삭제하시겠습니까?");
	return true;
}