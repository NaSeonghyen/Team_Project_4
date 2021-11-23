<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- 20211101 위재림  비밀번호 JS 추가 -->
	<script type="text/javascript">
		if (window.name == "update") {
			window.opener.parent.location.href = "Ot4zoServlet?command=board_update_form&bId=${param.bId}";
		} else if (window.name == 'delete') {
			alert('삭제되었습니다.');
			window.opener.parent.location.href = "Ot4zoServlet?command=board_delete&bId=${param.bId}";
		}else if (window.name == 'updateNotice') {
			window.opener.parent.location.href = "Ot4zoServlet?command=notice_update_form&nId=${param.nId}";
		}else if (window.name == 'deleteNotice') {
			alert('삭제되었습니다.');
			window.opener.parent.location.href = "Ot4zoServlet?command=notice_delete&nId=${param.nId}";
		}
		window.close();
	</script>
</body>
</html>