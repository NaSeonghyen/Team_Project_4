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
//20211104 위재림 주문 내역 동작 구현
public class OrderListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/myinfo/orderlist.jsp";
		// 로그인 세션 생성
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    // 로그인이 안된 경우 로그인 화면으로 이동
	    if (loginUser == null) {
	    	url = "Ot4zoServlet?command=login_form";
	    // 로그인이 된 경우 데이터를 가지고 주문조회 화면으로 이동
	    } else {
	    	OrderDAO orderDAO = OrderDAO.getInstance();
	    	ArrayList<Integer> oseqList = orderDAO.selectSeqOrderIng(loginUser.getMemId());
	    	ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
	    	
	    	for (int oseq : oseqList) {
		    	ArrayList<OrderVO> orderListIng = orderDAO.listOrderById(loginUser.getMemId(),oseq);
		    	OrderVO orderVO = orderListIng.get(0);
		    	orderVO.setPname(orderVO.getPname() + " 외 " + (orderListIng.size()-1) + "건");
		    	
		    	int totalPrice = 0;
		    	for (OrderVO ovo : orderListIng) {
		    		totalPrice += ovo.getProduct_price() * ovo.getQuantity();
		    	}
		    	int totalQuantity = 0;
		    	
		    	for (OrderVO ovo : orderListIng) {
		    		totalQuantity += ovo.getQuantity();
			    }
		    	
		    	System.out.println(totalQuantity);
		    	orderVO.setProduct_price(totalPrice);
		    	orderVO.setQuantity(totalQuantity);
		    	orderList.add(orderVO);
	    	}
	    	request.setAttribute("title", "진행 중인 주문 내역");
	    	request.setAttribute("orderList", orderList);
    	}
    	request.getRequestDispatcher(url).forward(request,response);
	}
}
