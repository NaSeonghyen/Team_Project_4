/* 20211104 송석환,신정민 JS 회원정보수정 작업 START */

// 회원수정체크 함수
function updateCheck() {
	if (document.frm.mb_email.value == 0) {
		alert("이메일을 입력해주세요.");
		frm.mb_email.focus();
		return false;
	}
	else if (document.frm.mb_pw.value == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.mb_pw.focus();
		return false;
	}
	else if (document.frm.mb_pw.value.length > 20 || document.frm.mb_pw.value.length < 8) {
		alert("비밀번호는 최소 8글자, 최대 20자 이내로 입력해주세요.");
		frm.mb_pw.focus();
		return false;
	}
	else if (document.frm.mb_pw_y.value.length == 0) {
		alert("비밀번호 확인을 입력해주세요");
		frm.mb_pw_y.focus();
		return false;
	}
	else if (document.frm.mb_pw.value != document.frm.mb_pw_y.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.mb_pw.focus();
		return false;
	}
	else if (document.frm.mb_name.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.mb_name.focus();
		return false;
	}
	else if (document.frm.mb_birth_y.value.length == 0) {
		alert("년을 입력해주세요.");
		document.frm.mb_birth_y.focus();
		return false;
	}
	else if (document.frm.mb_birth_y.value.length != 4) {
		alert("4자리로 입력해주세요.");
		document.frm.mb_birth_y.focus();
		return false;
	}
	else if (isNaN(document.frm.mb_birth_y.value)) {
		alert("숫자로 입력해주세요.");
		document.frm.mb_birth_y.focus();
		return false;
	}
	else if (document.frm.mb_birth_m.value == "") {
		alert("월을 선택해주세요.");
		document.frm.mb_birth_m.focus();
		return false;
	}
	else if (document.frm.mb_birth_d.value == "") {
		alert("일을 선택해주세요.");
		document.frm.mb_birth_d.focus();
		return false;
	}
	else if (document.frm.mb_hp.value.length == 0) {
		alert("휴대전화 번호를 입력해주세요.");
		frm.mb_hp.focus();
		return false;
	} else if (document.frm.mb_birth_y.value.length == 0) {
		alert("년을 입력해주세요.");
		document.frm.mb_birth_y.focus();
		return false;	
	} else if (document.frm.mb_birth_y.value.length != 4) {
		alert("4자리로 입력해주세요.");
		document.frm.mb_birth_y.focus();
		return false;	
	} else if(isNaN(document.frm.mb_birth_y.value)) {
		alert("숫자로 입력해주세요.");
		document.frm.mb_birth_y.focus();
		return false;
	} else if (document.frm.mb_birth_m.value == "") {
		alert("월을 선택해주세요.");
		document.frm.mb_birth_m.focus();
		return false;	
	} else if (document.frm.mb_birth_d.value == "") {
		alert("일을 선택해주세요.");
		document.frm.mb_birth_d.focus();
		return false;	
	}
	else{
		alert("회원 수정이 완료되었습니다.");
		return true;
	}
}
/* 20211104 송석환,신정민 JS 회원정보수정 작업 END */