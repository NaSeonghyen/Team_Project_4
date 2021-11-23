package com.notice.controller.action;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.member.controller.action.Action;
import com.oreilly.servlet.MultipartRequest;
import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.vo.NoticeVO; 
//20211029 위재림 공지사항 게시글 수정 동작 구현
public class NoticeUpdateAction implements Action {
	
	private MultipartRequest multi;
	
	public NoticeUpdateAction(MultipartRequest multi) {	
		this.multi = multi;
	}
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nId=0;
		try{
			nId =Integer.parseInt(multi.getParameter("nId"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(nId);
	  	System.out.println("아이디는" + nId);
		String nAdminID = multi.getParameter("nAdminID");
		String nPass = multi.getParameter("nPass");
		String nTitle = multi.getParameter("nTitle");
		String nContent = multi.getParameter("nContent");
		String nPictureurl =multi.getFilesystemName("nPictureurl");
		
		System.out.println("abc:"+nPictureurl);  
		  
		NoticeVO bVo = new NoticeVO();
		
		bVo.setnId(nId);
		bVo.setnAdminID(nAdminID);
		bVo.setnPass(nPass);
		bVo.setnTitle(nTitle);
		bVo.setnContent(nContent);
		bVo.setnPictureurl(nPictureurl);
		
		NoticeDAO nDao = NoticeDAO.getInstance();
		nDao.updateNotice(bVo);
		(new NoticeListAdminPageAction()).execute(request, response);
	}
}
