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
import com.ot4zo.vo.BoardSearchVO;

//20211015 위재림 1:1 문의 검색 동작 구현
public class BoardKeywordListPageAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/board/qna_searchlistpage.jsp";
		String page =(String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		
		String field = (String)request.getParameter("f");
		//String title = (String)request.getParameter("bTitle");
		String keyword = (String)request.getParameter("keyword");
	
		String field_ = "bSubTitle";
		if(field != null||field.equals("")) {
			field_ = field;
		}
		String keyword_ = "";
		if(keyword != null||keyword.equals("")) {
			keyword_ = keyword;
		}		
		if(page == null) {
			page="1";
		}
		if(pageDataCount == null) {
			pageDataCount = "5";
		}
		System.out.println(page);
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardVO> dvos = dao.searchSelect(page, pageDataCount,field_,keyword_);
		request.setAttribute("dvos", dvos);
		
		int totalDataCount = dao.dataCount(field_,keyword_);		
		
		BoardSearchVO bSearchDvo = new BoardSearchVO();
		bSearchDvo.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount),totalDataCount,field_,keyword_);
		request.setAttribute("bSearchDvo", bSearchDvo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
