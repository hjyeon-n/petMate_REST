package com.ssd.petMate.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ssd.petMate.Controller.SignInCommand;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
//		session의 아이디 값이 null이거나 session의 id 값이 해당 회원의 id가 맞는지 검사 
		if (request.getSession().getAttribute("userID") == null) {			
//			ModelAndView를 이용해 url은 그대로 두고 화면만 전환하도록 함
			SignInCommand signInCommand = new SignInCommand();
			ModelAndView mv = new ModelAndView();
			mv.addObject("signInCommand", signInCommand);
			mv.setViewName("user/signIn");
			throw new ModelAndViewDefiningException(mv);
		}
		return true; // handler method 실행
	}
}

