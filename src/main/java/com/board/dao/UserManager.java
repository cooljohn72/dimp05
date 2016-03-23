package com.board.dao;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.web.dao.SpringDao;
import com.board.beans.*;

public class UserManager {
	
	@Autowired
	private SpringDao dao;
	
//	on Step0, check if the user has right to create advisory or project
	public boolean ableToUploadPost(User user)
	{
		
		return false;
	}

}
