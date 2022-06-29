package com.solutions.web.admin.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			if(request.getSession().getAttribute("session_admin") == null) {
				response.sendRedirect(request.getContextPath() + "/log/notlogin");
				return false;
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
}
