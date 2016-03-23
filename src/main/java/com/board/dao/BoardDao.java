package com.board.dao;

import java.sql.*;
import java.util.ArrayList;
//import java.util.regex.Pattern;




//import com.board.action.board;
import com.board.beans.Board;

public class BoardDao extends CommonDao{
	
	public static BoardDao getInstance(){
		BoardDao _instance = new BoardDao();
		_instance.SetDB();
		return _instance;
	}
		
	@SuppressWarnings("unchecked")
	public ArrayList<Board> getArticleList(int page, int articlePerPage){
		ArrayList<Board> articleList = new ArrayList<Board>();
		
		try {
			articleList = (ArrayList<Board>) GetDB().queryForList("getArticleList", null, page, articlePerPage);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return articleList;			
	}
	
	//method to get a article
	public Board retrieveArticle(int idx){
		Board board = new Board();
							
		try {
			board =  (Board) GetDB().queryForObject("retrieveArticle", idx);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		return board;
	}

	
	//method to delete a article
	public void deleteArticle(String idx){
		
		try {
			GetDB().delete("deleteArticle", idx);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}			
	}
	
	//method to create new article
	public void createArticle(Board article){	
		
		try {
			GetDB().insert("createArticle", article);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	// method to add count of an article
	public void setArticleCount(Board article){
		try {
			GetDB().update("setArticleCount", article);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
