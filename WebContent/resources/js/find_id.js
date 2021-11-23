/* 20211014 위재림, 이상훈 JS 아이디 찾기 작업 START */
// 아이디 찾기 유효성 체크
function id_search() { 
	if (document.frm.mb_name.value.length == 0) {
		alert("이름을 입력해주세요");
		frm.mb_name.focus();
		return false;
  	} else if (document.frm.mb_hp_02.value.length == 0) {
		alert("휴대전화 번호를 입력해주세요.");
		frm.mb_hp_02.focus();
		return false;	
	} else if (document.frm.mb_hp_03.value.length == 0) {
		alert("휴대전화 번호를 입력해주세요.");
		frm.mb_hp_03.focus();
		return false;	
	} else if(isNaN(document.frm.mb_hp_02.value)) {
		alert("숫자로 입력해주세요.");
		frm.mb_hp_02.focus();
		return false;
	} else if(isNaN(document.frm.mb_hp_03.value)) {
		alert("숫자로 입력해주세요.");
		frm.mb_hp_03.focus();
		return false;
	} else {
		return true;
	}
}
/* 20211014 위재림, 이상훈 JS 아이디 찾기 작업 END */