package com.ot4zo.vo;
//20211010 위재림 회원 정보 VO 생성
public class MemberVO {
	// DB에 사용된 컬럼 변수 선언 및 GETTER, SETTER 작업 공간
	String memId;
	String memPw;
	String memName;
	String memEmail;
	String memBirth;
	String memphone;
	String memAddr;
	String memAddr2;
	String memRecepmail;
	String memRecepsms;
	String memRegdate;
	String memStatus;
	String adminyn;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemphone() {
		return memphone;
	}
	public void setMemphone(String memphone) {
		this.memphone = memphone;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemAddr2() {
		return memAddr2;
	}
	public void setMemAddr2(String memAddr2) {
		this.memAddr2 = memAddr2;
	}
	public String getMemRecepmail() {
		return memRecepmail;
	}
	public void setMemRecepmail(String memRecepmail) {
		this.memRecepmail = memRecepmail;
	}
	public String getMemRecepsms() {
		return memRecepsms;
	}
	public void setMemRecepsms(String memRecepsms) {
		this.memRecepsms = memRecepsms;
	}
	public String getMemRegdate() {
		return memRegdate;
	}
	public void setMemRegdate(String memRegdate) {
		this.memRegdate = memRegdate;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	public String getAdminyn() {
		return adminyn;
	}
	public void setAdminyn(String adminyn) {
		this.adminyn = adminyn;
	}
	@Override
	public String toString() {
		return "MemberVO [ memId=" + memId + ", memPw=" + memPw + ", memName=" + memName
				+ ", memEmail=" + memEmail + ", memBirth=" + memBirth + ", memphone=" + memphone + ", memAddr="
				+ memAddr + ", memAddr2=" + memAddr2 + ", memRecepmail=" + memRecepmail + ", memRecepsms=" + memRecepsms
				+ ", memRegdate=" + memRegdate + ", memStatus=" + memStatus + ", adminyn=" + adminyn + "]";
	}
}
