package com.board.beans;


public class Application {
	
	private int	idx;
	private int	writerIdx;
	private String writerName;
	private String	writerAddress1;
	private String	writerSchool;
	private String	writerDegree;
	private String	writerCompany;
	private String	writerRole;
	private float	score;
	private int	howManyInvolved;
	private String	selfIntro_copied;
	private String	writerPlan;
	private int	expectingCost;
	private int	expectingDays;
	private int	postIdx;		// 지원서가 제출된 관련 advisory / project
	private String	createdDate;
	private String	updatedDate;
	private String	submitDate;
	private boolean	isDeleted;
	private String	deletedDate;		// 삭제 날짜, 시간.
	private int	userIdxWhoDeletedMe;		// 삭제한 사용자 id
	private String	status;		//1: saved, 2;submitted
	private String	lastUpdatedDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getWriterIdx() {
		return writerIdx;
	}
	public void setWriterIdx(int writerIdx) {
		this.writerIdx = writerIdx;
	}
	public String getWriterAddress1() {
		return writerAddress1;
	}
	public void setWriterAddress1(
			String writerAddress1) {
		this.writerAddress1 = writerAddress1;
	}
	public String getWriterSchool() {
		return writerSchool;
	}
	public void setWriterSchool(
			String writerSchool) {
		this.writerSchool = writerSchool;
	}
	public String getWriterDegree() {
		return writerDegree;
	}
	public void setWriterDegree(
			String writerDegree) {
		this.writerDegree = writerDegree;
	}
	public String getWriterCompany() {
		return writerCompany;
	}
	public void setWriterCompany(
			String writerCompany) {
		this.writerCompany = writerCompany;
	}
	
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public int getHowManyInvolved() {
		return howManyInvolved;
	}
	public void setHowManyInvolved(
			int howManyInvolved) {
		this.howManyInvolved = howManyInvolved;
	}
	public String getSelfIntro_copied() {
		return selfIntro_copied;
	}
	public void setSelfIntro_copied(
			String selfIntro_copied) {
		this.selfIntro_copied = selfIntro_copied;
	}	
	public String getWriterPlan() {
		return writerPlan;
	}
	public void setWriterPlan(
			String writerPlan) {
		this.writerPlan = writerPlan;
	}
	public int getExpectingCost() {
		return expectingCost;
	}
	public void setExpectingCost(
			int expectingCost) {
		this.expectingCost = expectingCost;
	}
	public int getExpectingDays() {
		return expectingDays;
	}
	public void setExpectingDays(
			int expectingDays) {
		this.expectingDays = expectingDays;
	}
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(
			String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(
			String updatedDate) {
		this.updatedDate = updatedDate;
	}
	public boolean isDeleted() {
		return isDeleted;
	}
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getDeletedDate() {
		return deletedDate;
	}
	public void setDeletedDate(
			String deletedDate) {
		this.deletedDate = deletedDate;
	}
	public int getUserIdxWhoDeletedMe() {
		return userIdxWhoDeletedMe;
	}
	public void setUserIdxWhoDeletedMe(
			int userIdxWhoDeletedMe) {
		this.userIdxWhoDeletedMe = userIdxWhoDeletedMe;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(
			String submitDate) {
		this.submitDate = submitDate;
	}
	public String getWriterRole() {
		return writerRole;
	}
	public void setWriterRole(
			String writerRole) {
		this.writerRole = writerRole;
	}
	public String getLastUpdatedDate() {
		return lastUpdatedDate;
	}
	public void setLastUpdatedDate(
			String lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(
			String writerName) {
		this.writerName = writerName;
	}
	
}
