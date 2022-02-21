package com.samsoum.newro.service;

import java.sql.SQLException;
import java.util.List;

import com.samsoum.newro.model.Question;
import com.samsoum.newro.persistence.QuestionDAO;

public class QuestionService {
	private static QuestionService instance;
	
	private QuestionService() {
		
	}
	public static QuestionService getInstance() {
		if (QuestionService.instance == null) {
			QuestionService.instance = new QuestionService();
		}
		return QuestionService.instance;
	}
	
	public static boolean doesExist(int id) {
		try {
			QuestionDAO.getInstance().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}	
	public List<Question> getAll() throws SQLException {
		return QuestionDAO.getInstance().getAll();
	}
	public void add(Question data) throws SQLException {
		QuestionDAO.getInstance().add(data);
	}
	public Question getOne(int id) throws SQLException {
		return QuestionDAO.getInstance().getOne(id);
	}
	public List<Question> getPaginated() throws SQLException {
		return QuestionDAO.getInstance().getPaginated();
	}
	public void delete(int id) throws SQLException{
		QuestionDAO.getInstance().delete(id);
	}
	public void update(Question promotion) throws SQLException{
		QuestionDAO.getInstance().update(promotion);
	}
}
