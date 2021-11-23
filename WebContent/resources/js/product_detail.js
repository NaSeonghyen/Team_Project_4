/* 20210903 이상훈 상품 상세페이지 JS 작업 START */
/* 로드 시 상세정보와 리뷰 숨김 이벤트*/
$(document).ready(function(){
    $(".img-info").hide();
    $(".item-review").hide();
	// 수량 선택상자 체크
	var quantity= new URLSearchParams(location.search).get('quantity');
  	$('#quantity').val(quantity).prop("selected", true);
});

$(function(){
    /* 상세정보 클릭 시 발생하는 이벤트 */
    $(".detail-tab").on("click",function(){
        $(".img-info").show();
        $(".item-review").hide();
    });

    /* 리뷰 클릭 시 발생하는 이벤트 */
    $(".review").on("click",function(){
        $(".img-info").hide();
        $(".item-review").show();
    });

    /* 댓글 등록 이벤트 */
    $(".item-review-btn").on("click",function(){
        alert("리뷰를 등록하였습니다.");
    });
});
/* 20210903 이상훈 상품 상세페이지 JS 작업 END */

/* 20211101 나성현 상품 상세페이지 JS 추가 작업 START */
// 구매하기 화면으로 넘어가기
function go_purchase() {
	// 상품 번호 가져오기
	var pseq= new URLSearchParams(location.search).get('pseq');
	if(!!(document.getElementById("sizeElement")) == true){
		if (document.frm.quantity.value == "0") {
		    alert("수량을 입력하여 주세요.");
		    document.frm.quantity.focus();
		} else if (document.frm.size.value == "선택") {
			alert("사이즈를 입력하여 주세요.");
		    document.frm.size.focus();
		} else {
		    document.frm.action = "Ot4zoServlet?command=order&pseq=" + pseq +"&cseq=0";
		    document.frm.submit();
		}
		
	} else {
		if (document.frm.quantity.value == "0") {
		    alert("수량을 입력하여 주세요.");
		    document.frm.quantity.focus();
		} else {
		    document.frm.action = "Ot4zoServlet?command=order&pseq=" + pseq;
		    document.frm.submit();
		}
	}
  
}
// 상세 페이지 입력내용 확인 후 장바구니 화면으로 넘어가기
function go_cart() {
	//상품 번호 가져오기
	var pseq= new URLSearchParams(location.search).get('pseq');
	if(!!(document.getElementById("sizeElement")) == true){
		if (document.frm.size.value == "선택") {
			alert("사이즈를 입력하여 주세요.");
		    document.frm.size.focus();
		} else if (document.frm.quantity.value == "선택") {
		    alert("수량을 입력하여 주세요.");
		    document.frm.quantity.focus();
		} else {
			alert("장바구니에 추가하였습니다.");
		    document.frm.action = "Ot4zoServlet?command=cart_insert&pseq=" + pseq;
		    document.frm.submit();
		}
		
	} else {
		if (document.frm.quantity.value == "선택") {
		    alert("수량을 입력하여 주세요.");
		    document.frm.quantity.focus();
		} else {
			alert("장바구니에 추가하였습니다.");
		    document.frm.action = "Ot4zoServlet?command=cart_insert&pseq=" + pseq;
		    document.frm.submit();
		}
	}
}

// 수량 자동으로 변경
function chageQuantitySelect(){ 
	var quantitySelect = document.getElementById("quantity");
	var selectValue = quantitySelect.options[quantitySelect.selectedIndex].value;
	var pseq= new URLSearchParams(location.search).get('pseq');
	var url = "Ot4zoServlet?command=product_detail&pseq=" + pseq +"&quantity=" + selectValue;
		window.open(url, "_self","toolbar=no, menubar=no, scrollbars=yes, resizable=no");
}
/* 20211101 나성현 상품 상세페이지 JS 추가 작업 END */
