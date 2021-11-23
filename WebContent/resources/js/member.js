/* 20211002 위재림 로그인화면 JS 작업 START */
function loginCheck() {
	if (document.frm.mb_id.value.length == 0) {
		alert("아이디를 써주세요");
		frm.mb_id.focus();
		return false;	}
	if (document.frm.mb_password.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.mb_password.focus();
		return false;
	}
	return true;
}
/* 20211002 위재림 로그인화면 JS 작업 END */
