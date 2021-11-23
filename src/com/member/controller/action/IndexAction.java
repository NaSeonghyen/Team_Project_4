package com.member.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.dao.ProductDAO;
import com.ot4zo.vo.NoticeVO;
import com.ot4zo.vo.ProductVO;

//20211011 나성현 메인 화면 동작 구현
public class IndexAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {    
		String url = "/index.jsp";
		HttpSession session = request.getSession();
		// NEW, BEST 상품리스트 가져오기
	    ProductDAO productDAO=ProductDAO.getInstance();
	    ArrayList<ProductVO> newProductList = productDAO.listNewProduct();
	    ArrayList<ProductVO> bestProductList = productDAO.listBestProduct();
	    
	    // 공지사항 리스트 가져오기
	    NoticeDAO noticeDAO =NoticeDAO.getInstance();
	    ArrayList<NoticeVO> newNotice = noticeDAO.listNoticeIndex();
	    
	    session.getAttribute("loginUser");
	    request.setAttribute("newNotice", newNotice);
	    request.setAttribute("newProductList", newProductList);
	    request.setAttribute("bestProductList", bestProductList);
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
  }
}
