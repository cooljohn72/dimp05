package com.board.beans;

import java.util.List;

public class User {
	
	private int idx;	
	private String eMail;
	private String nickName;
	private String password;	
	private String regip;
	private String createdTime;
	private String activatedTime;
	private String lastLoinTime;
	private String legalName;
	private String address1;
	private String address2;
	private List<Contact> phoneNumbers;
	private String mainPhoneNumber;
	private String birthYearMonth;
	private String gender;
	private String[] interestingCategories;
	private List<AcademicBackground> academicBackground;	
	private List<Career> career;
	private String additionalCareer;
	private String selfIntro;
	private float score;
	private String userType;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getNickName() {		
		if (this.nickName==null)
			return this.eMail;
		else
			return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRegip() {
		return regip;
	}
	public void setRegip(String regip) {
		this.regip = regip;
	}
	public String getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(
			String createdTime) {
		this.createdTime = createdTime;
	}
	public String getActivatedTime() {
		return activatedTime;
	}
	public void setActivatedTime(
			String activatedTime) {
		this.activatedTime = activatedTime;
	}
	public String getLastLoinTime() {
		return lastLoinTime;
	}
	public void setLastLoinTime(
			String lastLoinTime) {
		this.lastLoinTime = lastLoinTime;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLegalName() {
		return legalName;
	}
	public void setLegalName(
			String legalName) {
		this.legalName = legalName;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public List<Contact> getPhoneNumbers() {
		return phoneNumbers;
	}
	public void setPhoneNumbers(
			List<Contact> phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}
	public String getBirthYearMonth() {
		return birthYearMonth;
	}
	public void setBirthYearMonth(
			String birthYearMonth) {
		this.birthYearMonth = birthYearMonth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getInterestingCategories() {
		return interestingCategories;
	}
	public void setInterestingCategories(
			String[] interestingCategories) {
		this.interestingCategories = interestingCategories;
	}
	public List<AcademicBackground> getAcademicBackground() {
		return academicBackground;
	}
	public void setAcademicBackground(
			List<AcademicBackground> academicBackground) {
		this.academicBackground = academicBackground;
	}
	public List<Career> getCareer() {
		return career;
	}
	public void setCareer(
			List<Career> career) {
		this.career = career;
	}
	public String getAdditionalCareer() {
		return additionalCareer;
	}
	public void setAdditionalCareer(
			String additionalCareer) {
		this.additionalCareer = additionalCareer;
	}
	public String getSelfIntro() {
		return selfIntro;
	}
	public void setSelfIntro(
			String selfIntro) {
		this.selfIntro = selfIntro;
	}
	public String getMainPhoneNumber() {
		return mainPhoneNumber;
	}
	public void setMainPhoneNumber(
			String mainPhoneNumber) {
		this.mainPhoneNumber = mainPhoneNumber;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
}



