package com.solutions.web.main.daos;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.solutions.web.main.models.InquiryDTO;

public class MainDAO extends SqlSessionDaoSupport {

	// 견적상담 insert
	public int insertInquiry(String string, InquiryDTO dto) {
		return getSqlSession().insert(string, dto);
	}
	
}
