/* 20211026 나성현 JS 상품페이지 JS 작업 START */

// 페이지 로드 시 정렬 자동 선택
$( document ).ready(function() {
	// 쿼리스트링 내 sort, product_kind 값 추출
    var sortVal= new URLSearchParams(location.search).get('sort');
	var kindVal = new URLSearchParams(location.search).get('product_kind');
	var selOpVal = sortVal + kindVal;
	
	// 선택상자 체크
  	$('#select_sort').val(selOpVal).prop("selected", true);

	// 카테고리 색상 변경
	if(kindVal == "NEW"){
		$("#tab-1").css("color","#030303");
	} else if(kindVal == "BEST"){
		$("#tab-2").css("color","#030303");
	} else if(kindVal == "가디건/자켓"){
		$("#tab-3").css("color","#030303");
	} else if(kindVal == "코트"){
		$("#tab-4").css("color","#030303");
	} else if(kindVal == "ACC"){
		$("#tab-5").css("color","#030303");
	} else if(kindVal == "니트/스웨터"){
		$("#tab-6").css("color","#030303");
	} else if(kindVal == "셔츠/블라우스"){
		$("#tab-7").css("color","#030303");
	} else if(kindVal == "팬츠"){
		$("#tab-8").css("color","#030303");
	} else if(kindVal == "슬랙스"){
		$("#tab-9").css("color","#030303");
	} else if(kindVal == "레깅스"){
		$("#tab-10").css("color","#030303");
	} else if(kindVal == "스커트"){
		$("#tab-11").css("color","#030303");
	}
});

// 상품 정렬
function productsort() {
	var sortId = document.getElementById("select_sort");
	var sortValue = sortId.options[sortId.selectedIndex].value;
	var sortNum = sortValue.substring(0,1);
	var kind = sortValue.substring(1);
	var url = "Ot4zoServlet?command=product&sort=" + sortNum +"&product_kind=" + kind;
	window.open(url, "_self","toolbar=no, menubar=no, scrollbars=yes, resizable=no");
}
/* 20211026 나성현 JS 상품페이지 JS 작업 END */