package com.ot4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ot4zo.vo.MemberVO;

import util.DBManager;
// 20211012 나성현 회원 DAO 생성
// 20211020 송석환 회원 정보 update 수정, delete 추가
// 20211104 신정민 회원 정보 update 수정, delete 수정
//회원 테이블을 액세스하는 DAO 클래스
public class MemberDAO {
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	//사용자 인증시 사용하는 메소드
	public int userCheck(String userid,String pwd) {
		int result = -1;
		String sql = "select member_pw from member where member_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("member_pw")!=null&&rs.getString("member_pw").equals(pwd)){
					result = 1;
				}else {
					result = 0;
				}
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	//아이디로 회원 정보 가져오는 메소드
	public MemberVO getMember(String userid) {
		MemberVO mvo = null;
	      
		String sql = "select * from member where member_id=? and member_status='N'";
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	      
	    try {
    		conn = DBManager.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, userid);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    						mvo = new MemberVO();
							mvo.setMemId(rs.getString("MEMBER_ID"));
							mvo.setMemPw(rs.getString("MEMBER_PW"));
							mvo.setMemName(rs.getString("MEMBER_NAME"));
							mvo.setMemEmail(rs.getString("MEMBER_EMAIL"));
							mvo.setMemBirth(rs.getString("MEMBER_BIRTH"));
							mvo.setMemphone(rs.getString("MEMBER_PHONE"));
							mvo.setMemAddr(rs.getString("MEMBER_ADDR"));
							mvo.setMemAddr2(rs.getString("MEMBER_ADDR2"));
							mvo.setMemRecepmail(rs.getString("MAIL_RECEPTION"));
							mvo.setMemRecepsms(rs.getString("SMS_RECEPTION"));
							mvo.setAdminyn(rs.getString("ADMIN_YN"));
							mvo.setMemRegdate(rs.getString("MEMBER_REGDATE"));
							mvo.setMemStatus(rs.getString("MEMBER_STATUS"));
    		}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt, rs);
	    }
	    return mvo;
	}
	
	// 아이디 찾기 메소드 
	public String findId(String name, String phone) {
		String userid = null;
		String sql = "select member_id from member where member_name=? and member_phone=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userid = rs.getString("member_id");
			} 
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return userid;
	}
	
	// 비밀번호 찾기 메소드 
	public int findPW(String name, String mb_id) {
		int result = -1;
		String sql = "select member_id from member where member_name=? and member_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, mb_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	//회원정보 수정하는 메서드
	public int updateMember(MemberVO mvo) {
		int result = -1;
		String sql = "update member set member_pw=?,member_name=?,"
				+ "member_email=?,member_birth=?,member_phone=?,mail_reception=?,"
				+ "sms_reception=? where member_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mvo.getMemPw());
			pstmt.setString(2, mvo.getMemName());
			pstmt.setString(3, mvo.getMemEmail());
			pstmt.setString(4, mvo.getMemBirth());
			pstmt.setString(5, mvo.getMemphone());
			pstmt.setString(6, mvo.getMemRecepmail());
			pstmt.setString(7, mvo.getMemRecepsms());
			pstmt.setString(8, mvo.getMemId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;		
	}
		
	//회원 정보 삭제하는 메서드
	public int deleteMember(String mb_id,String mb_pw) {
		int result = -1;
		String sql = "update member set member_status='Y' where member_id=? and member_pw=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, mb_id);
	        pstmt.setString(2, mb_pw);
	        result = pstmt.executeUpdate();
	        if(rs.next()) {
	        	result = 1;
	        }else {
	        	result = -1;
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;     
	}

	
	// 회원 정보를 DB에 추가하는 메소드
	public int insertMember(MemberVO mvo) {
		int result = -1;
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,'N',TO_CHAR(SYSDATE,'YYYYMMDD'),'N')";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getMemId());
			pstmt.setString(2, mvo.getMemPw());
			pstmt.setString(3, mvo.getMemName());
			pstmt.setString(4, mvo.getMemEmail());
			pstmt.setString(5, mvo.getMemBirth());
			pstmt.setString(6, mvo.getMemphone());
			pstmt.setString(7, mvo.getMemAddr());
			pstmt.setString(8, mvo.getMemAddr2());
			pstmt.setString(9, mvo.getMemRecepmail());
			pstmt.setString(10, mvo.getMemRecepsms());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	//아이디 중복 체크를 위한 메소드
	public int confirmID(String userid) {
		int result = -1;
		String sql = "select member_id from member where member_id =?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	// 비밀번호 변경 메소드
	public int pwChange(String mb_id, String pwd) {

		int result = -1;
		String sql = "update member set member_pw=? where member_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mb_id);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return result;		
	}
}
