package com.mrs.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter { //꼭 상속받아야한다!

	//Controller가기전에 잡는 거
	//True가 반환되지 않으면 못지나 감(원하는 컨트롤러 요청으로)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
			throws Exception {
		//System.out.println("Controller 접근 전");
		//세션검사
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("loginid"));
		//System.out.println("session 값 있어? : " + session);
		//세션에 loginId가 없으면 -> /로 보낸다
		if(session.getAttribute("loginid") == null){
			//System.out.println("로그인 안한 놈..");
			response.sendRedirect("/project/index");
		}else {
			//System.out.println("로그인 한 분");
		}
		return true;
	}

	//컨트롤러 요청이 처리되고 난 후
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

	
}
