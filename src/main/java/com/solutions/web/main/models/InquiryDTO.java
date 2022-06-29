package com.solutions.web.main.models;

import org.springframework.web.multipart.MultipartFile;

public class InquiryDTO {
	
	private int code;
	private String name;
	private String phone;
	private String email;
	private String queContent;
	private MultipartFile queFile;
	private String queFilePath;
	private String queDate;
	
	private String ansContent;
	private MultipartFile ansFile;
	private String ansFilePath;
	private String ansDate;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQueContent() {
		return queContent;
	}
	public void setQueContent(String queContent) {
		this.queContent = queContent;
	}
	public MultipartFile getQueFile() {
		return queFile;
	}
	public void setQueFile(MultipartFile queFile) {
		this.queFile = queFile;
	}
	public String getQueFilePath() {
		return queFilePath;
	}
	public void setQueFilePath(String queFilePath) {
		this.queFilePath = queFilePath;
	}
	public String getQueDate() {
		return queDate;
	}
	public void setQueDate(String queDate) {
		this.queDate = queDate;
	}
	public String getAnsContent() {
		return ansContent;
	}
	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}
	public MultipartFile getAnsFile() {
		return ansFile;
	}
	public void setAnsFile(MultipartFile ansFile) {
		this.ansFile = ansFile;
	}
	public String getAnsFilePath() {
		return ansFilePath;
	}
	public void setAnsFilePath(String ansFilePath) {
		this.ansFilePath = ansFilePath;
	}
	public String getAnsDate() {
		return ansDate;
	}
	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}
	
	
	@Override
	public String toString() {
		return "InquiryDTO [code=" + code + ", name=" + name + ", phone=" + phone + ", email=" + email + ", queContent="
				+ queContent + ", queFile=" + queFile + ", queFilePath=" + queFilePath + ", queDate=" + queDate
				+ ", ansContent=" + ansContent + ", ansFile=" + ansFile + ", ansFilePath=" + ansFilePath + ", ansDate="
				+ ansDate + "]";
	}
	
	
	
	
	
	
	
	

}
