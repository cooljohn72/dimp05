package com.board.beans;

import java.util.ArrayList;

public class Board {
	
	private int idx;	
	private String postType;	//--- 1;advisory 2;project
	private String title;
	private int writerIdx;	
	private String regdate;
	private int count;
	private String content;
	private String regip;
	private String filename;
	private boolean isDeleted;
	private String deletedDate;
	private int deleteUserIdx;
	
	private int ownerType;
	private String 				categories;		//--- string 을 주로 쓰자 
	private ArrayList<String> 	categoriesAL;
	private String 				stageCategories;
	private ArrayList<String> 	stageCategoriesAL;
	private String				keyword;
	private ArrayList<String> 	keywordAL;
	private int expectingDays;
	private int expectingCost;
	private String 				requiredOutputs;	//--- 숫자 모양의 문자로 받자. 이건 코드야.
	private ArrayList<String> 	requiredOutputsAL;
	private String				requiredOutput1;
	private String				requiredOutput2;
	private String				requiredOutput3;
	private String				requiredOutput4;
	private String qualification;
	private int emailNotice;	//---0;no 1;yes
	// postStatus ; 
	private String postStatus;
	private String postDate;
	private int howManyApplied;
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
//	public int getWriter() {
//		return writerIdx;
//	}
//	public void setWriter(int writer) {
//		this.writerIdx = writer;
//	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isDeleted() {
		return isDeleted;
	}
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	public int getWriterIdx() {
		return writerIdx;
	}
	public void setWriterIdx(int writerIdx) {
		this.writerIdx = writerIdx;
	}
	public String getDeletedDate() {
		return deletedDate;
	}
	public void setDeletedDate(
			String deletedDate) {
		this.deletedDate = deletedDate;
	}
	public int getDeleteUserIdx() {
		return deleteUserIdx;
	}
	public void setDeleteUserIdx(
			int deleteUserIdx) {
		this.deleteUserIdx = deleteUserIdx;
	}
	public int getOwnerType() {
		return ownerType;
	}
	public void setOwnerType(int ownerType) {
		this.ownerType = ownerType;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(
			String categories) {
		this.categories = categories;
	}
	public String getStageCategories() {
		return stageCategories;
	}
	public void setStageCategories(
			String stageCategories) {
		this.stageCategories = stageCategories;
	}
	public ArrayList<String> getKeywordAL() {
		return keywordAL;
	}
	public void setKeywordAL(
			ArrayList<String> keyword) {
		this.keywordAL = keyword;
	}
	public int getExpectingDays() {
		return expectingDays;
	}
	public void setExpectingDays(
			int expectingDays) {
		this.expectingDays = expectingDays;
	}
	public int getExpectingCost() {
		return expectingCost;
	}
	public void setExpectingCost(
			int expectingCost) {
		this.expectingCost = expectingCost;
	}
	public String getRequiredOutput() {
		return requiredOutputs;
	}
	public void setRequiredOutput(
			String requiredOutput) {
		this.requiredOutputs = requiredOutput;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(
			String qualification) {
		this.qualification = qualification;
	}
	public int getEmailNotice() {
		return emailNotice;
	}
	public void setEmailNotice(
			int emailNotice) {
		this.emailNotice = emailNotice;
	}
	public ArrayList<String> getCategoriesAL() {
		return categoriesAL;
	}
	public void setCategoriesAL(
			ArrayList<String> categoriesAL) {
		this.categoriesAL = categoriesAL;
	}
	public ArrayList<String> getStageCategoriesAL() {
		return stageCategoriesAL;
	}
	public void setStageCategoriesAL(
			ArrayList<String> stageCategoriesAL) {
		this.stageCategoriesAL = stageCategoriesAL;
	}
	public ArrayList<String> getRequiredOutputAL() {
		return requiredOutputsAL;
	}
	public void setRequiredOutputAL(
			ArrayList<String> requiredOutputAL) {
		this.requiredOutputsAL = requiredOutputAL;
	}
	public String getPostStatus() {
		return postStatus;
	}
	public void setPostStatus(
			String postStatus) {
		this.postStatus = postStatus;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getRequiredOutput1() {
		return requiredOutput1;
	}
	public void setRequiredOutput1(
			String requiredOutput1) {
		this.requiredOutput1 = requiredOutput1;
	}
	public String getRequiredOutput2() {
		return requiredOutput2;
	}
	public void setRequiredOutput2(
			String requiredOutput2) {
		this.requiredOutput2 = requiredOutput2;
	}
	public String getRequiredOutput3() {
		return requiredOutput3;
	}
	public void setRequiredOutput3(
			String requiredOutput3) {
		this.requiredOutput3 = requiredOutput3;
	}
	public String getRequiredOutput4() {
		return requiredOutput4;
	}
	public void setRequiredOutput4(
			String requiredOutput4) {
		this.requiredOutput4 = requiredOutput4;
	}
	public String getRequiredOutputs() {
		return requiredOutputs;
	}
	public void setRequiredOutputs(
			String requiredOutputs) {
		this.requiredOutputs = requiredOutputs;
	}
	public ArrayList<String> getRequiredOutputsAL() {
		return requiredOutputsAL;
	}
	public void setRequiredOutputsAL(
			ArrayList<String> requiredOutputsAL) {
		this.requiredOutputsAL = requiredOutputsAL;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public int getHowManyApplied() {
		return howManyApplied;
	}
	public void setHowManyApplied(
			int howManyApplied) {
		this.howManyApplied = howManyApplied;
	}
	
}
