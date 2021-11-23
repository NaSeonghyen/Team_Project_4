package com.mypage.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Action;
import com.ot4zo.dao.OrderDAO;
import com.ot4zo.vo.MemberVO;
import com.ot4zo.vo.OrderVO;
//20211104 위재림 주문 상세 내역 동작 구현
public class OrderDetailAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/myinfo/orderDetail.jsp";
		// 로그인 세션 생성
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    // 로그인이 안된 경우 로그인 화면으로 이동
	    if (loginUser == null) {
	    	url = "Ot4zoServlet?command=login_form";
	    // 로그인이 된 경우 데이터를 가지고 장바구니 화면으로 이동
	    } else {
	    	int oseq=Integer.parseInt(request.getParameter("oseq").trim());
	    	OrderDAO orderDAO = OrderDAO.getInstance();
	    	ArrayList<OrderVO> orderList =orderDAO.listOrderResultById(loginUser.getMemId(), "%", oseq);
	    	
	    	int totalPrice=0;
	    	for(OrderVO ovo :orderList){
	    		totalPrice+=ovo.getProduct_price()*ovo.getQuantity();
	    	}
	    	request.setAttribute("orderDetail", orderList.get(0));
	    	request.setAttribute("orderList", orderList);
	    	request.setAttribute("totalPrice", totalPrice);
	    }
	    request.getRequestDispatcher(url).forward(request, response);
	}
}
