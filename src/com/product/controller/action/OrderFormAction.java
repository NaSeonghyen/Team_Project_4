package com.product.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Action;
import com.ot4zo.dao.CartDAO;
import com.ot4zo.dao.ProductDAO;
import com.ot4zo.vo.ProductVO;
//20211102 나성현 구매 폼 이동 구현
public class OrderFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {    
		String url = "views/product/order.jsp";  
		// 로그인 정보 가져오기
	    HttpSession session = request.getSession();
	    
	    // 상품 리스트에서 가져온 상품 고유번호 저장
	    String pseq= request.getParameter("pseq").trim();
	    
	    // 장바구니에서 가져온 상품 고유번호 저장
	    int cseq= Integer.parseInt((request.getParameter("cseq").trim()));
	    if(cseq != 0) {
	    	CartDAO cartDAO = CartDAO.getInstance();
	    	int quantity = cartDAO.getCartQuantity(cseq);
	    	String size = cartDAO.getCartStyle(cseq);
	    	
    		request.setAttribute("quantity", quantity);
    		request.setAttribute("size",size);
    		cartDAO.cartStateUpdate(cseq);
	    	
	    } else {
	    	request.setAttribute("quantity", request.getParameter("quantity"));
		    request.setAttribute("size", request.getParameter("size"));
	    }
	    // 상품 고유번호를 통해 해당 데이터 가져오기
	    ProductDAO productDAO=ProductDAO.getInstance();
	    ProductVO productVO= productDAO.getProduct(pseq);
	    
	    session.getAttribute("loginUser");
	    request.setAttribute("productVO", productVO);
	    
	    RequestDispatcher dispatcher=request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);    
  }
}
