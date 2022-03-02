package com.samsoum.newro.service;

import java.sql.SQLException;
import java.util.List;

import com.samsoum.newro.model.Question;
import com.samsoum.newro.persistence.DAOException;
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
	
	public static boolean doesExist(int id) throws SQLException, DAOException {
		try {
			QuestionDAO.getInstance().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}	
	public List<Question> getAll() throws SQLException, DAOException {
		return QuestionDAO.getInstance().getAll();
	}
	public void add(Question data) throws SQLException, DAOException {
		QuestionDAO.getInstance().add(data);
	}
	public Question getOne(int id) throws SQLException, DAOException {
		return QuestionDAO.getInstance().getOne(id);
	}
	public List<Question> getPaginated() throws SQLException, DAOException {
		return QuestionDAO.getInstance().getPaginated();
	}
	public void delete(int id) throws SQLException, DAOException {
		QuestionDAO.getInstance().delete(id);
	}
	public void update(Question promotion) throws SQLException, DAOException {
		QuestionDAO.getInstance().update(promotion);
	}
}
