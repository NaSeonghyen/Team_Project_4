package com.member.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//20211011 나성현 Action 인터페이스 생성
public interface Action {
	 public void execute(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException;
}
