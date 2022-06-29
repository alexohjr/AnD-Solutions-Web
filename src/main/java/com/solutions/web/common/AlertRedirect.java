package com.solutions.web.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AlertRedirect {
	
	public AlertRedirect(HttpServletResponse response, String message, String location) {
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out;
		try {
			out = response.getWriter();
			
			out.println("<script>alert('" + message + "'); location.href='" + location + "';</script>'");
			
			out.flush();
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
