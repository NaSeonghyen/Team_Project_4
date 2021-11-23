package com.product.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Action;
import com.ot4zo.dao.OrderDAO;
import com.ot4zo.vo.MemberVO;
//20211102 나성현 주문 삽입 동작 구현
public class OrderInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "Ot4zoServlet?command=order_list";    
    
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
    
	    if (loginUser == null) {
	    	url = "Ot4zoServlet?command=login_form";
	    } else {
	    	int pseq = Integer.parseInt(request.getParameter("pseq"));
	    	int quantity = Integer.parseInt(request.getParameter("quantity"));
	    	String size = request.getParameter("size");
	    	OrderDAO orderDAO = OrderDAO.getInstance();      
	      
	    	int maxOseq=orderDAO.insertOrder(pseq, quantity, size, loginUser.getMemId());
		    url = "Ot4zoServlet?command=order_list&oseq="+maxOseq;
	    }
	    response.sendRedirect(url);
	}
}
