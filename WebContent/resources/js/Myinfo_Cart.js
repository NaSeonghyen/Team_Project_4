/* 20210902 윤소라 장바구니페이지 JS 작업 START */

// 전체 체크시 모두 체크하게 하는 이벤트
function checkall(){
	if($("#cart_all").is(':checked')){
		$("input[name=cseq]").prop("checked",true);
  	} else {
    	$("input[name=cseq]").prop("checked",false);
  	}
}
/* 20210902 윤소라 장바구니페이지 JS 작업 END */

/* 20211103 나성현 장바구니 삭제 JS 작업 START */
// 장바구니 리스트 개별 삭제
function go_cart_delete() {
	var count = 0;
	//장바구니 항목 검사
  	if (document.frm.cseq.length == undefined) {
		if (document.frm.cseq.checked == true) {
		  count++;
		}
 	}
	//체크한 개수만큼 카운트 증가
	for ( var i = 0; i < document.frm.cseq.length; i++) {
		if (document.frm.cseq[i].checked == true) {
		  count++;
		}
  	}
	//체크한 항목이 없는 경우
	if (count == 0) {
    	alert("삭제할 항목을 선택해 주세요.");
	//체크한 항목이 있는 경우
	} else {
	    document.frm.action = "Ot4zoServlet?command=cart_delete";
	    document.frm.submit();
  	}
}

//장바구니 리스트 전체 삭제
function go_cart_all_delete() {
	//전체 체크 하기
	$("input[name=cseq]").prop("checked",true);
	alert("장바구니 항목을 모두 삭제합니다.");
	go_cart_delete();
}
/* 20211103 나성현 장바구니 삭제 JS 작업 END */