package com.solutions.web.admin.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.solutions.web.admin.models.AdminDTO;
import com.solutions.web.admin.models.CountDTO;
import com.solutions.web.admin.models.ListDTO;
import com.solutions.web.main.models.InquiryDTO;

public interface AdminService {
	
	// 관리자 로그인 체크
	public boolean adminLogin(AdminDTO adminDTO, HttpServletRequest request);
	
	// 견적요청글 리스트 타입 카운트
	public CountDTO getInquiryTypeCount();
	
	// 견적요청 글 카운트
	public int getInquiryCount(ListDTO listDTO);
	
	// 견적요청 리스트 가져오기
	public List<InquiryDTO> getInquiryList(ListDTO listDTO);
	
	// 견적요청 첨부파일 경로 가져오기
	public String getFilePath(int code);
	
	// 견적요청 답변 등록
	public int updateInquiryAnswer(InquiryDTO inquiryDTO);
	
	// 견적요청 삭제
	public int deleteInquiry(int code);
	
	
  
}
