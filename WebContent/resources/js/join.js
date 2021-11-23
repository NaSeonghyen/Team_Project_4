/* 20210831 이상훈 JS 회원가입 작업 START */
/* 전체동의 누른 경우 아래 체크박스 모두 선택 */
function selectAll(selectAll) {
    const checkboxes = document.getElementsByName('all-check');

    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
    })
}
/* 20210831 이상훈 JS 회원가입 작업 END */

/* 20211013 나성현,송석환 JS 회원가입 유효성 검사 작업 START */

// 회원가입 유효성 체크
function joinCheck() {
	if (document.frm.mb_id.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.mb_id.focus();
		return false;	
	} else if (document.frm.reid.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		frm.mb_id.focus();
		return false;
	} else if (document.frm.mb_pw.value.length == 0) {
		alert("비밀번호를 입력해주세요");
		frm.mb_pw.focus();
		return false;	
	} else if (document.frm.mb_pw.value.length > 20 || document.frm.mb_pw.value.length < 8) {
		alert("비밀번호는 최소 8글자, 최대 20자 이내로 입력해주세요.");
		frm.mb_pw.focus();
		return false;	
	} else if (document.frm.mb_pw_y.value.length == 0) {
		alert("비밀번호 확인을 입력해주세요");
		frm.mb_pw.focus();
		return false;
	} else if (document.frm.mb_pw.value != document.frm.mb_pw_y.value) {
		alert("비밀번호가 일치하지 않습니다.");
		frm.mb_pw.focus();
		return false;	
	} else if (document.frm.mb_name.value.length == 0) {
		alert("이름을 입력해주세요.");
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
		document.frm.mb_hp_02.focus();
		return false;
	} else if(isNaN(document.frm.mb_hp_03.value)) {
		alert("숫자로 입력해주세요.");
		document.frm.mb_hp_03.focus();
		return false;
	} else if (document.frm.mb_email.value.length == 0) {
		alert("이메일을 입력해주세요.");
		document.frm.mb_email.focus();
		return false;	
	} else if (document.frm.mb_email.value.indexOf("@") != -1) {
		alert("이메일에 @를 입력할 수 없습니다.");
		document.frm.mb_email.focus();
		return false;	
	} else if (document.frm.mb_email2.value == "") {
		alert("도메인을 선택해주세요.");
		document.frm.mb_email2.focus();
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
	} else if (document.frm.mb_addr.value == "") {
		alert("우편번호를 선택해주세요.");
		document.frm.mb_addr.focus();
		return false;	
	} else if (document.frm.mb_addr_1.value == "") {
		alert("우편번호를 선택해주세요.");
		document.frm.mb_addr_1.focus();
		return false;	
	} else if (document.frm.mb_addr_2.value == "") {
		alert("상세주소를 입력해주세요.");
		document.frm.mb_addr_2.focus();
		return false;	
	} else if (document.getElementById("check_1").checked == false) {
		alert("이용약관을 동의해주세요.");
		return false;	
	} else if (document.getElementById("check_2").checked == false) {
		alert("개인정보 수집 및 이용을 동의해주세요.");
		return false;	
	} else {
		alert("회원 가입이 되었습니다.");
		return true;
	}
}

// 아이디 중복 버튼 클릭 시 유효성 검사
function idCheck() {
	if (document.frm.mb_id.value == "") {
		alert('아이디를 입력해주세요.');
		document.frm.mb_id.focus();
		return;	
	}
	var url = "Ot4zoServlet?command=id_check_form&mb_id=" + document.frm.mb_id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes," +
					" resizable=no, width=550, height=300, top=300, left=300");
}

// 아이디 중복 체크
function idok() {
	opener.frm.mb_id.value = document.frm.mb_id.value;
	opener.frm.reid.value = document.frm.mb_id.value;
	self.close();
}

// 우편번호 찾기
function mb_addr_exeDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.frm.mb_addr_2.value = extraAddr;
                
                } else {
                    document.frm.mb_addr_2.value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.frm.mb_addr.value = data.zonecode;
                document.frm.mb_addr_1.value = addr;
            }
        }).open();
		// 커서를 상세주소 필드로 이동한다.
		document.frm.mb_addr_2.value.focus();
 }
/* 20211013 나성현 JS 회원가입 유효성 검사 작업 END */