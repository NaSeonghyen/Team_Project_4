package com.ot4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

import com.ot4zo.vo.CartVO;
//20211101 나성현 장바구니 DAO 생성
public class CartDAO {

	private CartDAO() {
	}

	private static CartDAO instance = new CartDAO();

	public static CartDAO getInstance() {
	return instance;
	}
	// 장바구니 생성
	public void insertCart(CartVO cartVO) {
		String sql = "insert into cart(cseq,member_id, pseq, cart_quantity, cart_size, cart_result, cart_indate)" +
				" values(cart_seq.nextval,?, ?, ?, ?, '1', SYSDATE)";
    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, cartVO.getId());
	      pstmt.setInt(2, cartVO.getPseq());
	      pstmt.setInt(3, cartVO.getQuantity());
	      pstmt.setString(4, cartVO.getSize());
	      pstmt.executeUpdate();
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt);
	    }
	}
	// 장바구니 리스트 가져오기
	public ArrayList<CartVO> listCart(String userId) {
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();    
	    String sql = "select * from cart_view where member_id=? order by cseq desc";
	    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, userId);
	      rs = pstmt.executeQuery();
	      while (rs.next()) {
	        CartVO cartVO = new CartVO();
	        cartVO.setCseq(rs.getInt(1));
	        cartVO.setId(rs.getString(2));
	        cartVO.setPseq(rs.getInt(3));
	        cartVO.setMname(rs.getString(4));
	        cartVO.setPname(rs.getString(5));
	        cartVO.setQuantity(rs.getInt(6));
	        cartVO.setSize(rs.getString(7));
	        cartVO.setIndate(rs.getTimestamp(8));
	        cartVO.setProduct_price(rs.getInt(9));
	        cartVO.setProduct_image(rs.getString(11));
	        cartVO.setProduct_url(rs.getString(12));
	        cartList.add(cartVO);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    }finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return cartList;
	}
	
	//장바구니 삭제
	public void deleteCart(int cseq) {
		String sql = "delete cart where cseq=?";
    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
    
	    try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			pstmt.executeUpdate();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt);
	    }
	}
	
	//장바구니 상태 변화
	public void cartStateUpdate(int cseq) {

		String sql = "update cart set cart_result='2' where cseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}	
	}
	
	// 장바구니에 저장된 수량 구하기
	public int getCartQuantity(int cseq) {
		int cartQuantity = 0;
		String sql = "select cart_quantity from cart_view where cseq=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
  
			while (rs.next()) {
				cartQuantity = Integer.parseInt(rs.getString("cart_quantity"));
			}
		} catch (Exception e) {
			e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
		return cartQuantity;
	}
		  
	// 장바구니에 저장된 스타일 구하기
	public String getCartStyle(int cseq) {
		String cartSize = "";
		String sql= "select cart_size from cart_view where cseq=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
  
			while (rs.next()) {
				cartSize = rs.getString("cart_size");
			}
		} catch (Exception e) {
			e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
		return cartSize;
	}
}
