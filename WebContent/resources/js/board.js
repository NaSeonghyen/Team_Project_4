/* 20211015 위재림 JS 게시글 작업 START */

// 1:1 문의 게시글 유효성 체크
function boardCheck() {
	if (document.frm.bSubTitle.value == "fail") {
		alert("문의유형을 선택해주세요.");
		return false;
	}
	if (document.frm.bTitle.value.length == 0) {
		alert("문의제목을 입력해주세요.");
		return false;
	}
	if (document.frm.MID.value.length == 0) {
		alert("아이디를 입력해주세요.");
		return false;
	}
	if (document.frm.bPassword.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	if (document.frm.bContent.value.length == 0) {
		alert("문의내용을 입력해주세요.");
		return false;
	}
	return true;	
}
// 공지사항 게시글 유효성 체크
function noticeCheck() {
	if (document.frm.nTitle.value.length == 0) {
		alert("공지제목을 입력해주세요.");
		return false;
	}
	if (document.frm.nAdminId.value.length == 0) {
		alert("아이디를 입력해주세요.");
		return false;
	}
	if (document.frm.nContent.value.length == 0) {
		alert("공지내용을 입력해주세요.");
		return false;
	}
	return true;	
}



function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}
function passCheck() {
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}
function npassCheck() {
	if (document.frm.npass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}
function abc() {
	$("#Pictureurl").on('change',function(){
  var fileName = $("#Pictureurl").val();
  $(".upload-name").val(fileName);
});

}
/* 20211015 위재림 JS 게시글 작업 END */