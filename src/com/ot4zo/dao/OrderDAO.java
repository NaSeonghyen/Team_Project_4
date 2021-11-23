package com.ot4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;
import com.ot4zo.vo.OrderVO;
//20211102 위재림 주문 DAO 생성
//20211104 나성현 주문 삽입 수정
public class OrderDAO {

	private OrderDAO() {
	}

	private static OrderDAO instance = new OrderDAO();

	public static OrderDAO getInstance() {
	return instance;
	}
	//주문 
	public int insertOrder(int pseq, int quantity, String size, String id) {
		
		int maxOseq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		
		String sql = "select max(oseq) from orders";
        
	    try {
	    	conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        if(rs.next()) {
	        	maxOseq = rs.getInt(1);
	        }
	        pstmt.close();
	      
	        String insertOrder = "insert into orders(oseq, id) values(" +
	    		  				"orders_seq.nextval, ?)";
		    pstmt = conn.prepareStatement(insertOrder);
		    pstmt.setString(1, id);
		    pstmt.executeUpdate();
		    pstmt.close();
	      
		    if(maxOseq == 0) {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					maxOseq = rs.getInt(1);
				}
		    }
	      
		    insertOrderDetail(pseq, quantity, size, maxOseq);
	      
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt);
	    }
	    return maxOseq;
	}
	// 주문 상세내역
	private void insertOrderDetail(int pseq, int quantity, String size, int maxOseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBManager.getConnection();
			String insertOrderDetail = "insert into order_detail(odseq, oseq, " +
					"pseq, quantity, order_SIZE) values(order_detail_seq.nextval, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(insertOrderDetail);
					pstmt.setInt(1, maxOseq);
					pstmt.setInt(2, pseq);
					pstmt.setInt(3, quantity);
					pstmt.setString(4, size);
					pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}	
	}
	// 아이디로 주문 내역 가져오기
	public ArrayList<OrderVO> listOrderById(String id,int oseq) {
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		String sql = "select * from order_view where id=? and oseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, oseq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setOdseq(rs.getInt("ODSEQ"));
				orderVO.setOseq(rs.getInt("OSEQ"));
				orderVO.setId(rs.getString("ID"));
				orderVO.setIndate(rs.getTimestamp("INDATE"));
				orderVO.setMname(rs.getString("MNAME"));
				orderVO.setAddress1(rs.getString("MEMBER_ADDR"));
				orderVO.setAddress2(rs.getString("MEMBER_ADDR2"));
				orderVO.setPhone(rs.getString("MEMBER_PHONE"));
				orderVO.setPseq(rs.getInt("PSEQ"));
				orderVO.setPname(rs.getString("PNAME"));
				orderVO.setQuantity(rs.getInt("QUANTITY"));
				orderVO.setSize(rs.getString("ORDER_SIZE"));
				orderVO.setProduct_price(rs.getInt("PRODUCT_PRICE"));
				orderVO.setResult(rs.getString("RESULT"));
				orderVO.setProduct_image(rs.getString("PRODUCT_IMAGE"));
				orderVO.setProduct_url(rs.getString("PRODUCT_URL"));
		
				orderList.add(orderVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return orderList;
	}
	//주문내역 가져오기
	public ArrayList<OrderVO> listOrderResultById(String id,String result,int oseq) {
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		String sql = "select * from order_view where id=? and result like '%'||?||'%' and oseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, result);
			pstmt.setInt(3, oseq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO orderVO = new OrderVO();
				orderVO.setOdseq(rs.getInt("ODSEQ"));
				orderVO.setOseq(rs.getInt("OSEQ"));
				orderVO.setId(rs.getString("ID"));
				orderVO.setIndate(rs.getTimestamp("INDATE"));
				orderVO.setMname(rs.getString("MNAME"));
				orderVO.setAddress1(rs.getString("MEMBER_ADDR"));
				orderVO.setAddress2(rs.getString("MEMBER_ADDR2"));
				orderVO.setPhone(rs.getString("MEMBER_PHONE"));
				orderVO.setPseq(rs.getInt("PSEQ"));
				orderVO.setPname(rs.getString("PNAME"));
				orderVO.setQuantity(rs.getInt("QUANTITY"));
				orderVO.setSize(rs.getString("ORDER_SIZE"));
				orderVO.setProduct_price(rs.getInt("PRODUCT_PRICE"));
				orderVO.setResult(rs.getString("RESULT"));
				orderVO.setProduct_image(rs.getString("PRODUCT_IMAGE"));
				orderVO.setProduct_url(rs.getString("PRODUCT_URL"));
		
				orderList.add(orderVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return orderList;
	}
	//주문내역 가져오기
	public ArrayList<Integer> selectSeqOrderIng(String id) {
		ArrayList<Integer> oseqList = new ArrayList<Integer>();
		String sql = "select distinct oseq from order_view where id=? order by oseq desc";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			oseqList.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return oseqList;
	}
}
