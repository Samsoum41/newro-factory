package com.samsoum.newro.service;

import java.sql.SQLException;

import com.samsoum.newro.persistence.QuestionDAO;

public class QuestionService {
	public static boolean doesExist(int id) {
		try {
			new QuestionDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}	
}
