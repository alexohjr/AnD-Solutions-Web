package com.solutions.web.main.controllers;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.solutions.web.common.AlertRedirect;
import com.solutions.web.main.models.InquiryDTO;
import com.solutions.web.main.services.MainService;

@Controller("mainController")
@RequestMapping("/main")
public class MainController {
	
	private MainService mainService;
	
	@Autowired
	@Required
	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}
	
	// 메인페이지  
	@RequestMapping(method=RequestMethod.GET)
	public String getMainPage() {
		return "tiles/main/main";
	}
	
	// 견적상담 신청
	@RequestMapping(value="/inquiry", method=RequestMethod.POST)
	public void insertInquiry(InquiryDTO dto, HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws IOException {
		
		// 파일 업로드
		MultipartFile fileup = dto.getQueFile();
		
		dto.setQueContent(dto.getQueContent().replaceAll("\r\n", "<br>"));
		
		if(fileup.getSize() > 0) {
			String file_path = fileup.getOriginalFilename();
			
			long now = System.currentTimeMillis();
			Random r = new Random();
			int i = r.nextInt(50);
			file_path = now + i + "_" + file_path;
			dto.setQueFilePath(file_path);
			
			
			String realPath = request.getServletContext().getRealPath("/");
			String path = "resources/upload/files/";
			
			String fullPath = realPath + path;
			
			// 경로에 폴더 없으면 만들어주기
			File dir = new File(fullPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			try {
				File new_file = new File(fullPath + file_path);
				fileup.transferTo(new_file);
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
		} else {
			dto.setQueFilePath(null);
		}
		
		mainService.insertInquiry(dto);
		
		String message = "견적 신청이 완료되었습니다.\\n답변은 메일로 발송될 예정이며 최대 2~3일 소요됩니다.";
		String location = "/andsolutions/main";
		
		new AlertRedirect(response, message, location);
		
		//return "redirect:/main?message=success";
	}

}
