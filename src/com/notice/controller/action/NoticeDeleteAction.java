package com.notice.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.NoticeDAO;
//20211029 위재림 공지사항 게시글 삭제 동작 구현
public class NoticeDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nId=request.getParameter("nId");
		NoticeDAO ndao=NoticeDAO.getInstance();
		ndao.deleteNotice(nId);
		new NoticeListAdminPageAction().execute(request, response);
	}
}
