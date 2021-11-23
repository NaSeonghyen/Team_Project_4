package com.ot4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ot4zo.vo.NoticeVO;

import util.DBManager;
//20211019 위재림 공지사항 DAO 생성
public class NoticeDAO {
	DataSource dataSource;
	  
	private static NoticeDAO instance = new NoticeDAO();
	  
	public static NoticeDAO getInstance() {
		return instance;
	}
	  
	public NoticeDAO() {
		try {
			Context context = new InitialContext();
			this.dataSource = (DataSource)context.lookup("java:comp/env/jdbc/myoracle");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	  
	// 공지사항 리스트 얻어오기
	public ArrayList<NoticeVO> listNoticeIndex() {
		ArrayList<NoticeVO> noticeList = new ArrayList<>();
		String sql = "select * from (select * from noticeboard order by ndate desc) where rownum <= 4";
    
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setnId(rs.getInt("nid"));
				notice.setnTitle(rs.getString("ntitle"));
				notice.setnDate(rs.getTimestamp("ndate"));
				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt, rs);
	    }
	    return noticeList;
	}
	  
	// 공지사항 리스트 가져오기
	public ArrayList<NoticeVO> listNotice() {
		ArrayList<NoticeVO> dvos = new ArrayList<>();
	    String query = "select nId, nAdminId,nPass, nTitle, nContent,nPictureurl, nDate, nHit, nIndent from noticeboard";
	    Connection conn = null;
	    Statement st = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        st = conn.createStatement();
	        rs = st.executeQuery(query);
	        System.out.println(query);
	        while (rs.next())
	        	dvos.add(new NoticeVO(
	        			rs.getInt("nId"), 
	        			rs.getString("nAdminId"),
		 	            rs.getString("nPass"),
		 	            rs.getString("nTitle"), 
		 	            rs.getString("nContent"),
		 	            rs.getString("nPictureurl"), 
		 	            rs.getTimestamp("nDate"), 
		 	            rs.getInt("bHit"),
		 	            rs.getInt("nIndent"))); 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null)
	    			rs.close(); 
		        if (st != null)
		        	st.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	    return dvos;
	}
	//공지사항 등록
	public void write(String nAdminId,String nPass, String nTitle, String nContent, String nPictureurl) {
		Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        String query = "insert into noticeboard (nId,nAdminId,nPass,nTitle,nContent,nPictureurl,nhit,nindent) values (noticeboard_seq.nextval, ?, ?, ?, ?, ?, 0, 0 )";
	        ps = conn.prepareStatement(query);
	        ps.setString(1, nAdminId);
	        ps.setString(2, nPass);
	        ps.setString(3, nTitle);
	        ps.setString(4, nContent);
	        ps.setString(5, nPictureurl);
	      
	        ps.executeUpdate();
	        System.out.println(query);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (ps != null)
	    			ps.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	}
	// 공지사항 게시글 가져오기
	public NoticeVO select(String strID) {
		upHit(strID);
	    NoticeVO dto = null;
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	    	String query = "select * from noticeboard where nId = ?";
	    	ps = conn.prepareStatement(query);
	    	ps.setInt(1, Integer.parseInt(strID));
	    	rs = ps.executeQuery();
	    	System.out.println();
	    	while (rs.next())
	    		dto = new NoticeVO(
	    			rs.getInt("nId"), 
					rs.getString("nAdminId"),
					rs.getString("nPass"),
					rs.getString("nTitle"), 
					rs.getString("nContent"),
					rs.getString("nPictureurl"), 
					rs.getTimestamp("nDate"), 
					rs.getInt("nHit"),
					rs.getInt("nIndent"));
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		          rs.close(); 
		        if (ps != null)
		          ps.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} finally {
	    		try {
	    			if (rs != null)
	    				rs.close(); 
			        if (ps != null)
			            ps.close(); 
			        if (conn != null)
			            conn.close(); 
	    		} catch (Exception e3) {
	    			e3.printStackTrace();
	    		} 
	    	} 
	    } 
	return dto;
	}
	// 공지사항 가져오기
	public NoticeVO selectOneBoardByNum(String num) {
		String sql = "select * from noticeboard where nId = ?";
	    NoticeVO bVo = null;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, num);
	        rs = pstmt.executeQuery();
	        System.out.println(num);
	        if (rs.next()) {
		        bVo = new NoticeVO();
		        bVo.setnId(rs.getInt("nId"));
		        bVo.setnAdminID(rs.getString("nAdminId"));
		        bVo.setnPass(rs.getString("nPass"));
		        bVo.setnTitle(rs.getString("nTitle"));
		        bVo.setnContent(rs.getString("nContent"));
		        bVo.setnPictureurl(rs.getString("nPictureurl"));
		        bVo.setnDate(rs.getTimestamp("nDate"));
		        bVo.setnHit(rs.getInt("nHit"));
		        bVo.setnIndent(rs.getInt("nIndent"));
	        } 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } 
	    return bVo;
	}
	// 공지사항 수정
	public void updateNotice(NoticeVO bVo) {
		String query = "update noticeboard set nAdminId=?,nPass=?,nTitle=?,nContent=?,nPictureurl=? where nId = ?";
	    Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        ps = conn.prepareStatement(query);
	        ps.setString(1, bVo.getnAdminID());
	        ps.setString(2, bVo.getnPass());
	        ps.setString(3, bVo.getnTitle());
	        ps.setString(4, bVo.getnContent());
	        ps.setString(5, bVo.getnPictureurl());
	        ps.setInt(6, bVo.getnId());
	        ps.executeUpdate();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (ps != null)
		        	ps.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	}
	//공지사항 삭제
	public void deleteNotice(String nId) {
		Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        String query = "delete from noticeboard where nId = ?";
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, Integer.parseInt(nId));
	        ps.executeUpdate();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (ps != null)
		        	ps.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	}
	//조회수 증가
	private void upHit(String strID) {
		Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        String query = "update noticeboard set nHit= nHit + 1 where nId = ?";
	        ps = conn.prepareStatement(query);
	        ps.setString(1, strID);
	        ps.executeUpdate();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (ps != null)
		        	ps.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	}
	//게시글 페이징
	public ArrayList<NoticeVO> select(String page, String pageDataCount) {
		ArrayList<NoticeVO> dtos = new ArrayList<>();
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	    	String query = String.format("select * from (select rownum m,nId,nAdminId,nPass,nTitle,nContent,nPictureurl,nDate,nHit,nIndent from noticeboard where rownum <= %s*%s "
	    			+ "order by nDate desc) where m>=(%s-1)*%s+1",page, pageDataCount, page, pageDataCount);
	    	System.out.println(query);
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
		        int nId = rs.getInt("nId");
		        String nAdminId = rs.getString("nAdminId");
		        String nPass =  rs.getString("nPass");
		        String nTitle = rs.getString("nTitle");
		        String nContent = rs.getString("nContent");
		        String nPictureurl = rs.getString("nPictureurl");
		        Timestamp nDate = rs.getTimestamp("nDate");
		        int nHit = rs.getInt("nHit");
		        int nIndent = rs.getInt("nIndent");
	   
		        NoticeVO dto = new NoticeVO(nId, nAdminId,nPass, nTitle, nContent, nPictureurl, nDate,nHit,nIndent);
		        dtos.add(dto);
	        } 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		        	rs.close(); 
		        if (stmt != null)
		        	stmt.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	    return dtos;
		}
	//데이터 카운트
	public int dataCount() {
		int returnValue = 0;
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = String.format("select count(nId) bCount from noticeboard");
	    System.out.println(query);
	    try {
	    	conn = this.dataSource.getConnection();
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next())
	        	returnValue = rs.getInt("bCount"); 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		          rs.close(); 
		        if (stmt != null)
		          stmt.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	    return returnValue;
	}
	//공지사항 검색
	public ArrayList<NoticeVO> searchSelect(String page, String pageDataCount, String field, String keyword) {
		ArrayList<NoticeVO> dtos = new ArrayList<>();
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	        conn = this.dataSource.getConnection();
	        String query = String.format("select * from (select rownum m,nId,nAdminId,nPass,nTitle,nContent,nPictureurl,nDate,nHit,nIndent "
	        		+ "from noticeboard "
	        		+ "where rownum <= %s*%s and %s like '%%%s%%' "
	        		+ "order by nDate desc) "
	        		+ "where m>=(%s-1)*%s+1", page, pageDataCount,field,keyword, page, pageDataCount);		
	        System.out.println(query);
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
		        int nId = rs.getInt("nId");
		        String nAdminId = rs.getString("nAdminId");
		        String nPass =  rs.getString("nPass");
		        String nTitle = rs.getString("nTitle");
		        String nContent = rs.getString("nContent");
		        String nPictureurl = rs.getString("nPictureurl");
		        Timestamp nDate = rs.getTimestamp("nDate");
		        int nHit = rs.getInt("nHit");
		        int nIndent = rs.getInt("nIndent");
		        NoticeVO dto = new NoticeVO(nId, nAdminId, nPass,nTitle, nContent, nPictureurl, nDate,nHit,nIndent);
		        dtos.add(dto);
	        } 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		        	rs.close(); 
		        if (stmt != null)
		        	stmt.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	    return dtos;
	}
	//데이터 카운트
	public int dataCount(String field_, String keyword_) {
		int returnValue = 0;
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = String.format("select count(nId) bCount from noticeboard "
	    		+"where %s like '%%%s%%' ",field_,keyword_);
	    System.out.println(query);
	    try {
	    	conn = this.dataSource.getConnection();
	    	stmt = conn.createStatement();
	    	rs = stmt.executeQuery(query);
	    	while (rs.next())
	    		returnValue = rs.getInt("bCount"); 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		        	rs.close(); 
		        if (stmt != null)
		        	stmt.close(); 
		        if (conn != null)
		        	conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	    return returnValue;
	}
}

	
