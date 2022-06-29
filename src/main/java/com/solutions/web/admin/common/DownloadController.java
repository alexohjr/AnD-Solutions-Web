package com.solutions.web.admin.common;

import java.io.File;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.solutions.web.admin.services.AdminService;


@Controller("downloadController")
@RequestMapping("/download")
public class DownloadController implements ApplicationContextAware {
	
	private AdminService adminService;
 
	@Required
	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	private WebApplicationContext context = null;
	
	@RequestMapping("/{code}")
	public ModelAndView download(@PathVariable int code) {
		File downloadFile = getFile(code);
		return new ModelAndView("downloadView", "downloadFile", downloadFile); // 뷰이름, 모델이름, 모델객체 순서
	}
	
	// 자동으로 호출되면서 현재 클래스의 컨텍스트를 어플리케이션 컨텍스트로 맞춘다.
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;
	}
	
	private File getFile(int code) {
		String dbPath = null;
		String path = null;
		
		dbPath = adminService.getFilePath(code);
		
		path = "resources/upload/files/";
		
		String realPath = context.getServletContext().getRealPath("/"); // 서버에 실제로 올라간 프로젝트명 까지의 절대경로
		String fullPath = realPath + path + dbPath;
		return new File(fullPath);
	}
	
}
