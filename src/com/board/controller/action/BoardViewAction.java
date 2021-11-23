package com.board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.BoardDAO;
import com.ot4zo.vo.BoardVO;
import com.ot4zo.vo.BoardSearchVO;
//20211014 위재림 1:1 문의 게시글 목록 동작 구현
public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/board/qnacontent.jsp";		
		String bId = request.getParameter("bId");
		BoardDAO dao = new BoardDAO();
		
		BoardVO dvo = dao.select(bId);
		request.setAttribute("dvo", dvo);
		
		BoardSearchVO bSearchDvo = new BoardSearchVO();
		int currentPageNum = Integer.parseInt(request.getParameter("page"));
		bSearchDvo.setCurrentPageNum(currentPageNum);
		int bPageDataCount = Integer.parseInt(request.getParameter("pageDataCount"));
		bSearchDvo.setPageDataCount(bPageDataCount);
		bSearchDvo.setSearchCol(request.getParameter("f"));
		bSearchDvo.setSearchVal(request.getParameter("keyword"));
		
		//bSearchDvo.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		request.setAttribute("bSearchDvo", bSearchDvo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
