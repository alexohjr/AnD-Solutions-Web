package com.solutions.web.admin.models;

public class CountDTO {
	
	private int totalCount;
	private int answeredCount;
	private int unansweredCount;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getAnsweredCount() {
		return answeredCount;
	}
	public void setAnsweredCount(int answeredCount) {
		this.answeredCount = answeredCount;
	}
	public int getUnansweredCount() {
		return unansweredCount;
	}
	public void setUnansweredCount(int unansweredCount) {
		this.unansweredCount = unansweredCount;
	}
	
	
	@Override
	public String toString() {
		return "CountDTO [totalCount=" + totalCount + ", answeredCount=" + answeredCount + ", unansweredCount="
				+ unansweredCount + "]";
	}

}
