/* 20210827 나성현,위재림 JS 헤더 작업 START */

/* Header 탭 메뉴 이벤트 */
$(function(){
	/* 마우스 포인터가 탭메뉴 안에 있는 경우  */
	$(document).on("mouseover focus", ".dept01", function() {
		$('.dept02').slideDown(10);
	});
	/* 마우스 포인터가 탭메뉴 바깥에 있는 경우  */
	$(document).on("mouseleave", "nav", function() {
		if(!$(this).hasClass('main_menu')) {
			$('.dept02').slideUp(10);
		}
	});
	/* 마우스 포인터가 탭메뉴 리스트에 안에 있는 경우  */
	$(document).on("mouseover focus", ".dept01 a", function() {
		$(this).css("color","#c0cde0");
	});
	/* 마우스 포인터가 탭메뉴 하위 리스트에 안에 있는 경우  */
	$(document).on("mouseover focus", ".dept02 li", function() {
		$(this).css("color","yellow");
		$(this).parent().prev().css("color","#c0cde0");
	});
	/* 마우스 포인터가 탭메뉴 리스트에 바깥에 있는 경우  */
	$(document).on("mouseout", ".dept02 li", function() {
		$(this).css("color","white");
		$(this).parent().prev().css("color","black");
	});
	/* 마우스 포인터가 탭메뉴 하위 리스트에 바깥에 있는 경우  */
	$(document).on("mouseout", ".dept01 a", function() {
		$(this).css("color","black");
	});
});

/* 20210827 나성현,위재림 JS 헤더 작업 END */

/* 20210902 나성현 JS 스크롤바에 의한 화면 너비값 차이 맞추기 작업 START */

/* 스크롤바 없는 화면과 스크롤바 있는 화면 너비값 맞추기 */
$(function(win,$){
	var $html = $("html");
	var deviceSize = {
		pc: 1080
	};
	
	/* 매개변수 전달된 값이 "scroll"이면 스크롤바 생성 후 너빗값 반환 */
	function scrollShowHide(status) {
		$html.css({"overflow-y":status});
		return $html.width();
	}

	$(win).on("resize", function(){
		scrollShowHide("scroll");
	})

	/* 문서가 로딩될 때 resize 이벤트 발생 */
	$(function(){
		$(win).trigger("resize");
	});

}(window,jQuery));
/* 20210902 나성현 JS 스크롤바에 의한 화면 너비값 차이 맞추기 작업 END */