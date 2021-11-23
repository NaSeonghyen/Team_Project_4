package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.member.controller.action.Action;
import com.oreilly.servlet.MultipartRequest;
import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.vo.NoticeVO;
//20211029 위재림 공지사항 등록 동작 구현
public class NoticeWriteAction implements Action {

	private MultipartRequest multi;
	
	public NoticeWriteAction(MultipartRequest multi) {	
		this.multi = multi;
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nAdminID = multi.getParameter("nAdminId");
		String nPass = multi.getParameter("nPass");
		String nTitle = multi.getParameter("nTitle");
		String nContent = multi.getParameter("nContent");
		String nPictureurl =multi.getFilesystemName("nPictureurl");
		
		System.out.println("abc:"+nPictureurl);
		
		NoticeVO bvo = new NoticeVO();
		
		bvo.setnAdminID(nAdminID);
		bvo.setnPass(nPass);
		bvo.setnTitle(nTitle);
		bvo.setnContent(nContent);
		bvo.setnPictureurl(nPictureurl);

		NoticeDAO ndao = NoticeDAO.getInstance();
		ndao.write(nAdminID,nPass,nTitle, nContent, nPictureurl);
		
		new NoticeListAdminPageAction().execute(request, response);
	}
}
