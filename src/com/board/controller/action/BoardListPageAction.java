package com.board.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.BoardDAO;
import com.ot4zo.vo.BoardVO;
import com.ot4zo.vo.BoardPageVO;
//20211015 위재림 1:1 문의 페이징 동작 구현
public class BoardListPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/board/qna_listpage.jsp";
		String page =(String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		if(page == null) {
			page="1";
		}
		if(pageDataCount == null) {
			pageDataCount = "5";
		}
		System.out.println(page);
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> dvos = dao.select(page, pageDataCount);
		request.setAttribute("dvos", dvos);
		int totalDataCount = dao.dataCount();		
		
		BoardPageVO bPageDvo = new BoardPageVO();
		bPageDvo.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		request.setAttribute("bPageDvo", bPageDvo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		System.out.println(bPageDvo);
		
	}

}
