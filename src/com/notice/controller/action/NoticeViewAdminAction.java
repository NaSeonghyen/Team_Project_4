package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.vo.NoticeSearchVO;
import com.ot4zo.vo.NoticeVO;
//20211029 위재림 공지사항 목록(관리자) 동작 구현
public class NoticeViewAdminAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/board/noticeAdmin_view.jsp";		
		String nId = request.getParameter("nId");
		NoticeDAO dao = new NoticeDAO();
		
		NoticeVO ndvo = dao.select(nId);
		request.setAttribute("ndvo", ndvo);
		
		NoticeSearchVO bSearchDvo = new NoticeSearchVO();
		int currentPageNum = Integer.parseInt(request.getParameter("page"));
		bSearchDvo.setCurrentPageNum(currentPageNum);
		int bPageDataCount = Integer.parseInt(request.getParameter("pageDataCount"));
		bSearchDvo.setPageDataCount(bPageDataCount);
		bSearchDvo.setSearchCol(request.getParameter("f"));
		bSearchDvo.setSearchVal(request.getParameter("keyword"));
		
		request.setAttribute("bSearchDvo", bSearchDvo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
