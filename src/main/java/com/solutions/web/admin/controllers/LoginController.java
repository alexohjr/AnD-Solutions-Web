package com.solutions.web.admin.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.solutions.web.admin.models.AdminDTO;
import com.solutions.web.admin.services.AdminService;
import com.solutions.web.common.AlertRedirect;

@Controller("loginController")
@RequestMapping("/log")
public class LoginController {
	
	private AdminService adminService;
	
	@Autowired
	@Required
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	// 관리자 로그인 체크
	@RequestMapping(value="/in", method=RequestMethod.POST)
	@ResponseBody
	public String adminLoginCheck(HttpServletRequest request, AdminDTO adminDTO) {
		
		boolean result = false;
		result = adminService.adminLogin(adminDTO, request);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		return jsonObject.toString();
	}
	
	// 관리자 로그아웃
	@RequestMapping(value="/out")
	public String adminLogout(HttpServletRequest request) {
		request.getSession().removeAttribute("session_admin");
		return "redirect:/admin";
	}
	
	// 관리자 로그인 안한경우
	@RequestMapping(value="/notlogin")
	public void adminNotLogin(HttpServletResponse response) {
		
		String message = "관리자 로그인 후 이용가능합니다.";
		String location = "/andsolutions/admin";
		
		new AlertRedirect(response, message, location);
		
		//return "admin/notlogin";
	}

}

