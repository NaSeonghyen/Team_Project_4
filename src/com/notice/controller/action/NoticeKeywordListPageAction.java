package com.notice.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.vo.NoticeSearchVO;
import com.ot4zo.vo.NoticeVO;

//20211029 위재림 공지사항 검색 동작 구현
public class NoticeKeywordListPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/board/notice_searchpage.jsp";
		String page =(String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		
		String field = (String)request.getParameter("f");
		String keyword = (String)request.getParameter("keyword");
	
		String field_ = "nTitle";
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
		
		
		NoticeDAO dao = new NoticeDAO();
		
		ArrayList<NoticeVO> dvos = dao.searchSelect(page, pageDataCount,field_,keyword_);
		request.setAttribute("ndvos", dvos);
		
		int totalDataCount = dao.dataCount(field_,keyword_);		
		
		NoticeSearchVO nSearchDvo = new NoticeSearchVO();
		nSearchDvo.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount),totalDataCount,field_,keyword_);
		request.setAttribute("nSearchDvo", nSearchDvo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
