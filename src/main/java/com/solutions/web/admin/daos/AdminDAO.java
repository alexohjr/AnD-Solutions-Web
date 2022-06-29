package com.solutions.web.admin.daos;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.solutions.web.admin.models.AdminDTO;
import com.solutions.web.admin.models.CountDTO;
import com.solutions.web.admin.models.ListDTO;
import com.solutions.web.main.models.InquiryDTO;

public class AdminDAO extends SqlSessionDaoSupport {

	// 관리자 로그인 체크
	public String adminLogin(String string, AdminDTO adminDTO) {
		String adminId = getSqlSession().selectOne(string, adminDTO);
		return adminId;
	}
	
	// 견적요청 글 리스트타입 카운트
	public CountDTO getInquiryTypeCount(String string) {
		CountDTO countDTO = getSqlSession().selectOne(string);
		return countDTO;
	}
	
	// 견적요청 글 카운트
	public int getInquiryCount(String string, ListDTO listDTO) {
		return getSqlSession().selectOne(string, listDTO);
	}
	
	// 견적요청 리스트 가져오기
	public List<InquiryDTO> getInquiryList(String string, ListDTO listDTO) {
		List<InquiryDTO> inquiryList = getSqlSession().selectList(string, listDTO);
		return inquiryList;
	}
	
	// 견적요청 첨부파일 경로 가져오기
	public String getFilePath(String string, int code) {
		return getSqlSession().selectOne(string, code);
	}
	
	// 견적요청 답변 등록
	public int updateInquiryAnswer(String string, InquiryDTO inquiryDTO) {
		return getSqlSession().update(string, inquiryDTO);
	}
	
	// 견적요청 삭제
	public int deleteInquiry(String string, int code) {
		return getSqlSession().delete(string, code);
	}
	
}
