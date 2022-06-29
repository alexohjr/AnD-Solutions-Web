package com.solutions.web.admin.models;

import java.util.List;

import com.solutions.web.main.models.InquiryDTO;

public class ListDTO {
	
	private String pageNum;
	private String type;
	private String option;
	private String keyword;
	private int inquiryCount;
	private int startRow;
	private int endRow;
	private List<InquiryDTO> inquiryList;
	
	public String getPageNum() {
		if(pageNum == null) {
			pageNum = "1";
		}
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public String getType() {
		if(type == null) {
			type = "all";
		}
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getInquiryCount() {
		return inquiryCount;
	}
	public void setInquiryCount(int inquiryCount) {
		this.inquiryCount = inquiryCount;
	}
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public List<InquiryDTO> getInquiryList() {
		return inquiryList;
	}
	public void setInquiryList(List<InquiryDTO> inquiryList) {
		this.inquiryList = inquiryList;
	}
	
	@Override
	public String toString() {
		return "ListDTO [pageNum=" + pageNum + ", type=" + type + ", option=" + option + ", keyword=" + keyword
				+ ", inquiryCount=" + inquiryCount + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
}
