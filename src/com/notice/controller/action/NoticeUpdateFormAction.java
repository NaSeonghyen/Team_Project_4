package com.notice.controller.action;

import com.member.controller.action.Action;
import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.vo.NoticeVO;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//20211029 위재림 공지사항 수정 폼 이동 구현
public class NoticeUpdateFormAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "views/board/noticeAdmin_update.jsp";
	    String nId = request.getParameter("nId");
	    
	    NoticeDAO nDao = NoticeDAO.getInstance();
	    NoticeVO nVo = nDao.selectOneBoardByNum(nId);
	    
	    System.out.println(nId);
	    request.setAttribute("notice", nVo);
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward((ServletRequest)request, (ServletResponse)response);
	}
}
