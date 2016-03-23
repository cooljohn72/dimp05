package com.spring.web.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.board.beans.*;

@Repository
public class SpringDao {
	
	@Autowired
	private SqlMapClient sql;
	
	@SuppressWarnings("unchecked")
	public ArrayList<String> ibatisTest() throws SQLException {
		return (ArrayList<String>)sql.queryForList("sql.showtable");
	}
	
	// insert new user
	public int createUser(User user) throws SQLException{
		return (Integer) sql.insert("sql.createUser", user);
	}
	
	//check email(id) and pw for... login?
	@SuppressWarnings("unchecked")
	public User getUserId(Map map) throws SQLException{
//		return the id value in integer or string
//		return (User)sql.queryForObject("sql.getUserId", map);
//		return (User) sql.queryForObject("sql.getUserId", map, new User());
		return (User) sql.queryForObject("sql.getUserId", map);
	}
	
	public User getUser(int uid) throws SQLException{
		return (User) sql.queryForObject("sql.getUser", uid);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Categories> getCategoryList() throws SQLException{
		return (ArrayList<Categories>)sql.queryForList("sql.getCategories");
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<StageCategories> getStageCategories() throws SQLException{
		return (ArrayList<StageCategories>)sql.queryForList("sql.getStageCategories");
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Outputs> getOutputs() throws SQLException{
		return (ArrayList<Outputs>)sql.queryForList("sql.getOutputs");
	}
	
	// 임시저장
	public int insertPostTemp(Board article) throws SQLException{
		return 0;
	}
	
	// 한번 임시 저장 후, 다시 임시저장되는 경우...즉 idx값이 있는 항목의 임시저
	public void updatePostTemp(Board article) throws SQLException{
		return;
	}
	
	// 공고 전 인서트..
	public int insertPost(Board article) throws SQLException {
		return (Integer) sql.insert("sql.createPostDraft", article);
	}	
	
	public void updatePostDraft(Board article) throws SQLException{
		return;
	}
	
	public Board getPost(Integer idx) throws SQLException{
		Board article = new Board();
		article.setIdx(idx);
		article = (Board) sql.queryForObject("sql.getPost", article.getIdx());
		return article;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<String> getPostCategories(int idx) throws SQLException{
		return (ArrayList<String>) sql.queryForList("sql.getPostCategories", idx);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<String> getPostStageCategories(int idx) throws SQLException{
		return (ArrayList<String>) sql.queryForList("sql.getPostStageCategories", idx);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<String> getPostRequiredOutputs(int idx) throws SQLException{
		return (ArrayList<String>) sql.queryForList("sql.getPostRequiredOutputs", idx);
	}
	
	public void deleteExistingCategories(int idx) throws SQLException{
		sql.delete("sql.deleteExistingCategories", idx);
	}
	
	public void insertCategories(Map map) throws SQLException{
		sql.insert("sql.insertCategories", map);
	}
	
	public void deleteExistingStageCategories(int idx) throws SQLException{
		sql.delete("sql.deleteExistingStageCategories", idx);
	}
	
	public void insertStageCategories(Map map) throws SQLException{
		sql.insert("sql.insertStageCategories", map);
	} 
	
	public void deleteExistingRequiredOutputs(int idx) throws SQLException{
		sql.delete("sql.deleteExistingRequiredOutputs", idx);
	}
	
	public void insertRequiredOutputs (Map map) throws SQLException{
		sql.insert("sql.insertRequiredOutputs", map);
	}
	
	// update nick name of a user
	
	// update a user to "kicked out"
	
	// update user's profile
	public void updateUserProfile(User user) throws SQLException{
		sql.update("sql.updateUserProfile", user);
	}
	
	public void loggingSignIn(int idx) throws SQLException{
		sql.insert("sql.loggingSignIn", idx);
	}
	
	// adding comment
	public void addComment(Comment comment) throws SQLException{
		sql.insert("sql.addComment", comment);
	}
	public void addReplyComment(Comment comment) throws SQLException{
		sql.insert("sql.addReplyComment", comment);
	}
	//getting comment list
	@SuppressWarnings("unchecked")
	public ArrayList<Comment> getCommentList(int idx) throws SQLException{		
		return (ArrayList<Comment>) sql.queryForList("sql.getCommentList", idx);
	}
	
//	## contact number from here
	public void initiateMainContact(int userIdx) throws SQLException{
		sql.update("sql.initiateMainContact", userIdx);
	}
	
	public void createNewContact(Contact contact) throws SQLException{
		sql.insert("sql.createNewContact", contact);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Contact> getContactNumberList(int userIdx) throws SQLException{
		return (ArrayList<Contact>) sql.queryForList("sql.getContactNumberList", userIdx);
	}
	public void deleteContact(int contactIdx) throws SQLException{
		sql.delete("sql.deleteContact", contactIdx);
	}
//	##/. contact number
	
//	academic background. school from here 
	public void initializeMainSchool(int userIdx) throws SQLException{
		sql.update("sql.initializeMainSchool", userIdx);
	}
	
	public void createNewSchool(AcademicBackground school) throws SQLException{
		sql.insert("sql.createNewSchool", school);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<AcademicBackground> getSchoolList(int userIdx) throws SQLException{
		return (ArrayList<AcademicBackground>) sql.queryForList("sql.getSchoolList", userIdx);
	}
//	/. academic background
	
//	career
//	initializeMainCareer
	public void initializeMainCareer(int userIdx) throws SQLException{
		sql.update("sql.initializeMainCareer", userIdx);
	}
	
	public void createNewCareer(Career career) throws SQLException{
		sql.insert("sql.createNewCareer", career);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Career> getCareerList(int userIdx) throws SQLException{
		return (ArrayList<Career>) sql.queryForList("sql.getCareerList", userIdx);
	}
//	/. career
	
//	application
	public Applicant getApplicant(int applicantIdx) throws SQLException{
		return (Applicant) sql.queryForObject("sql.getApplicant", applicantIdx);
	}
	
	public int createApplication(Application application) throws SQLException{
		return (Integer) sql.insert("sql.createApplication", application);  
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Application> getApplicationListOfaPost(int idx) throws SQLException{
		return (ArrayList<Application>)sql.queryForList("sql.getApplicationListOfaPost", idx);
	}
	
	public Application getApplication(int idx) throws SQLException{
				
		return (Application) sql.queryForObject("sql.getApplication", idx);
	}
	
	@SuppressWarnings("unchecked")
	
	public ArrayList<ArticleForList> getArticleList(ArticleForList article) throws SQLException{
//		return (ArrayList<ArticleForList>)sql.queryForList("sql.getArticleList", article);
		return (ArrayList<ArticleForList>)sql.queryForList("sql.getArticleList", article.getPostType());
	}
	
	public int getUserByEmail(String email) throws SQLException{		
		return (Integer) sql.queryForObject("sqlUser.getUserByEmail", email);
	}
	
	public int getHowManyUsersByEmail(String email) throws SQLException{
		return (Integer)sql.queryForObject("sql.getHowManyUsersByEmail", email);
	}
	
	public int getUserIdByActivationCode(String activationCode) throws SQLException{
		return (Integer) sql.queryForObject("sql.getUserIdByActivationCode", activationCode);
	}
	
	public int getUserIdByEmail_Idx(Map map) throws SQLException{
		return (Integer) sql.queryForObject("sql.getUserIdByEmail_Idx", map);
	}
	
	public void createSecuCode(Map map) throws SQLException{
		sql.insert("sql.createSecuCode", map);
	}
	
	public int getUserIdxBySecuCode(String secuCode) throws SQLException{
		return (Integer) sql.queryForObject("sql.getUserIdxBySecuCode", secuCode);
	}
	
	public void updateUserToActivated(Integer userIdxToActivate) throws SQLException{
		sql.update("sql.updateUserToActivated", userIdxToActivate);
	}
	
	public void removeComment(Integer commentIdx) throws SQLException{
		sql.update("sql.removeComment", commentIdx);
	}
	
//	/. application
//	
//	public User getUserByIdx(Integer uIdx) throws SQLException{
//		return (User) sql.queryForObject("sql.getUserByIdx", uIdx);
//	}
	
	 
	
}
