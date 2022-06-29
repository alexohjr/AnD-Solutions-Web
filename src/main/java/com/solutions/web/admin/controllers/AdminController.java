package com.solutions.web.admin.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.solutions.web.admin.common.Mailer;
import com.solutions.web.admin.models.CountDTO;
import com.solutions.web.admin.models.ListDTO;
import com.solutions.web.admin.models.MailDTO;
import com.solutions.web.admin.models.PageDTO;
import com.solutions.web.admin.services.AdminService;
import com.solutions.web.common.AlertRedirect;
import com.solutions.web.main.models.InquiryDTO;

@Controller("adminController")
@RequestMapping("/admin")
public class AdminController {

	private AdminService adminService;

	@Autowired
	@Required
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	// 관리자 로그인 페이지
	@RequestMapping(method = RequestMethod.GET)
	public String getAdminLoginPage() {
		return "admin_tiles/admin/login";
	}

	// 견적요청 리스트  
	@RequestMapping(value = "/list")
	public String getInquiryListPage(ListDTO listDTO, ModelMap modelMap) {

		CountDTO countDTO = new CountDTO();
		
		countDTO = adminService.getInquiryTypeCount();
		listDTO.setKeyword(null);
		listDTO.setOption(null);
		listDTO.setKeyword(null);
		
		// 전체 글 개수
		listDTO.setInquiryCount(adminService.getInquiryCount(listDTO));

		// 페이징 - 인자(총 글 개수, 페이지 번호, 한 페이지당 글 개수)
		PageDTO pageDTO = new PageDTO(listDTO.getInquiryCount(), new Integer(listDTO.getPageNum()), 10);
		
		listDTO.setStartRow(pageDTO.getPageBegin());
		listDTO.setEndRow(pageDTO.getPageEnd());
		
		System.out.println("inquiryCount :: " + listDTO.getInquiryCount());
		// 리스트 받아오기
		if (listDTO.getInquiryCount() > 0) {
			listDTO.setInquiryList(adminService.getInquiryList(listDTO));
		}

		// 어제 날짜 구하기
		/*GetDate gd = new GetDate();*/

		modelMap.addAttribute("today", new GetDate().getToday());
		modelMap.addAttribute("page", pageDTO);
		modelMap.addAttribute("listDTO", listDTO);
		modelMap.addAttribute("countDTO", countDTO);

		return "admin_tiles/admin/list";
	}

	@RequestMapping(value = "/answer", method = RequestMethod.POST)
	public void answerInquiry (ListDTO listDTO, InquiryDTO inquiryDTO, HttpServletResponse response) throws UnsupportedEncodingException {

		MailDTO mail = new MailDTO();
		mail.setMailFrom("help@andats.com");
		mail.setMailTo(inquiryDTO.getEmail());
		mail.setMailSubject("(주)에이앤디솔루션스 - " + inquiryDTO.getName() + "님 견적신청 답변메일입니다.");
		mail.setTemplateName("emailTemplate.vm");

		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:email/email-beans.xml");
		Mailer mailer = (Mailer) context.getBean("mailer");
		mailer.sendMail(mail, inquiryDTO.getName(), inquiryDTO.getAnsContent());

		adminService.updateInquiryAnswer(inquiryDTO);
		
		// redirect 파라미터 한글깨짐 처리
		if(listDTO.getKeyword().length() > 1) {
			listDTO.setKeyword(URLEncoder.encode(listDTO.getKeyword(), "UTF-8"));
		}
		
		String message = "답변 메일을 전송했습니다.";
		String location = "/andsolutions/admin/list?pageNum="+listDTO.getPageNum()+"&type="+listDTO.getType()+"&option="+listDTO.getOption()+"&keyword="+listDTO.getKeyword();
		
		new AlertRedirect(response, message, location);

		//return "redirect:/admin/list?pageNum="+listDTO.getPageNum()+"&type="+listDTO.getType()+"&option="+listDTO.getOption()+"&keyword="+listDTO.getKeyword();
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void deleteInquiry(ListDTO listDTO, InquiryDTO inquiryDTO, HttpServletResponse response) {
		
		adminService.deleteInquiry(inquiryDTO.getCode());
		
		String message = "견적문의가 삭제되었습니다.";
		String location = "/andsolutions/admin/list?pageNum="+listDTO.getPageNum()+"&type="+listDTO.getType()+"&option="+listDTO.getOption()+"&keyword="+listDTO.getKeyword();
		
		new AlertRedirect(response, message, location);

		//return "redirect:/admin/list";
	}

	public class GetDate {
		
		public String getToday() {
			Calendar c = Calendar.getInstance();
			Date date = c.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			return sdf.format(date);
		}

	}

}
