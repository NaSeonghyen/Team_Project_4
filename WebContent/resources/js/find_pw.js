/* 20211014 위재림, 이상훈 JS 비밀번호 찾기 작업 START */
// 비밀번호 찾기 유효성 체크
function pw_search(){
	if (document.pwfrm.mb_name.value.length == 0) {
		alert("이름을 입력해주세요");
		pwfrm.mb_name.focus();
		return false;
  	} else if (document.pwfrm.mb_id.value.length == 0) {
		alert("아이디를 입력해주세요.");
		pwfrm.mb_id.focus();
		return false;	
	} else {
		return true;
	}
  }
/* 20211014 위재림, 이상훈 JS 비밀번호 찾기 작업 END */

/* 20211019 나성현 JS 비밀번호 변경 작업 START */
// 비밀번호 변경 유효성 체크
function pw_change(){
	if (document.pwfrm.mb_pw.value.length == 0) {
		alert("비밀번호를 입력해주세요");
		pwfrm.mb_pw.focus();
		return false;	
	} else if (document.pwfrm.mb_pw.value.length > 20 || document.pwfrm.mb_pw.value.length < 8) {
		alert("비밀번호는 최소 8글자, 최대 20자 이내로 입력해주세요.");
		pwfrm.mb_pw.focus();
		return false;	
	} else if (document.pwfrm.mb_pw_y.value.length == 0) {
		alert("비밀번호 확인을 입력해주세요");
		pwfrm.mb_pw.focus();
		return false;
	} else if (document.pwfrm.mb_pw.value != document.pwfrm.mb_pw_y.value) {
		alert("비밀번호가 일치하지 않습니다.");
		pwfrm.mb_pw.focus();
		return false;	
	} else {
		return true;
	}
  }
/* 20211019 나성현 JS 비밀번호 변경 작업 END */