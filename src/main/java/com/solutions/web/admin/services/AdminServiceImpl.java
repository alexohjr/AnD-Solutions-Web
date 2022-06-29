package com.solutions.web.admin.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;

import com.solutions.web.admin.daos.AdminDAO;
import com.solutions.web.admin.models.AdminDTO;
import com.solutions.web.admin.models.CountDTO;
import com.solutions.web.admin.models.ListDTO;
import com.solutions.web.main.models.InquiryDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminDAO adminDAO;

	@Autowired
	@Required
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	// 관리자 로그인 체크
	@Override
	public boolean adminLogin(AdminDTO adminDTO, HttpServletRequest request) {
		boolean result = false;

		try {
			String adminId = null;
			adminId = adminDAO.adminLogin("admin.adminLogin", adminDTO);
			System.out.println("adminId :: " + adminId);

			if (adminId != null) {
				request.getSession().invalidate();
				request.getSession().setAttribute("session_admin", adminId);
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 견적요청 글 리스트타입 카운트
	@Override
	public CountDTO getInquiryTypeCount() {
		CountDTO countDTO = adminDAO.getInquiryTypeCount("admin.getInquiryTypeCount");
		return countDTO;
	}

	// 견적요청 글 카운트
	@Override
	public int getInquiryCount(ListDTO listDTO) {
		return adminDAO.getInquiryCount("admin.getInquiryCount", listDTO);
	}

	// 견적요청 리스트 가져오기
	@Override
	public List<InquiryDTO> getInquiryList(ListDTO listDTO) {
		List<InquiryDTO> inquiryList = null;
		inquiryList = adminDAO.getInquiryList("admin.getInquiryList", listDTO);
		return inquiryList;
	}

	// 견적요청 첨부파일 경로 가져오기
	@Override
	public String getFilePath(int code) {
		return adminDAO.getFilePath("admin.getFilePath", code);
	}
	
	// 견적요청 답변등록
	@Override
	public int updateInquiryAnswer(InquiryDTO inquiryDTO) {
		return adminDAO.updateInquiryAnswer("admin.updateInquiryAnswer", inquiryDTO);
	}
	
	// 견적요청 삭제
	@Override
	public int deleteInquiry(int code) {
		return adminDAO.deleteInquiry("admin.deleteInquiry", code);
	}

}
