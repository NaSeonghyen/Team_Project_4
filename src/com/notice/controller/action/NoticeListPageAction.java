package com.notice.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.vo.NoticePageVO;
import com.ot4zo.vo.NoticeVO;

//20211129 위재림 공지사항 게시글 페이징  구현
public class NoticeListPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/board/notice.jsp";
		String page =(String)request.getParameter("page");
		String pageDataCount = (String)request.getParameter("pageDataCount");
		if(page == null) {
			page="1";
		}
		if(pageDataCount == null) {
			pageDataCount = "5";
		}
		System.out.println(page);
		
		NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeVO> dvos = dao.select(page, pageDataCount);
		request.setAttribute("ndvos", dvos);
		
		System.out.println(dvos);
		
		int totalDataCount = dao.dataCount();			
		System.out.println("total data count: "+ totalDataCount);
		NoticePageVO nPageDvo = new NoticePageVO();
		nPageDvo.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		request.setAttribute("nPageDvo", nPageDvo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
