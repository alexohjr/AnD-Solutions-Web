package com.solutions.web.main.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;

import com.solutions.web.main.daos.MainDAO;
import com.solutions.web.main.models.InquiryDTO;

@Service
public class MainServiceImpl implements MainService {
	
	private MainDAO mainDAO;
	
	@Autowired
	@Required
	public void setMainDAO(MainDAO mainDAO) {
		this.mainDAO = mainDAO;
	}
	
	// 견적상담 insert
	@Override
	public int insertInquiry(InquiryDTO inquiryDTO) {
		return mainDAO.insertInquiry("main.insertInquiry", inquiryDTO);
	}

}
