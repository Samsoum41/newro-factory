package com.samsoum.newro.service;

import java.sql.SQLException;
import java.util.List;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.persistence.PromotionDAO;

public class PromotionService {
	private static PromotionService instance;
	
	private PromotionService() {
		
	}
	public static PromotionService getInstance() {
		if (PromotionService.instance == null) {
			PromotionService.instance = new PromotionService();
		}
		return PromotionService.instance;
	}
	
	public static boolean doesExist(int id) {
		try {
			PromotionDAO.getInstance().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}		
	public List<Promotion> getAll() throws SQLException {
		return PromotionDAO.getInstance().getAll();
	}
	public void add(Promotion data) throws SQLException {
		PromotionDAO.getInstance().add(data);
	}
	public Promotion getOne(int id) throws SQLException {
		return PromotionDAO.getInstance().getOne(id);
	}
	public List<Promotion> getPaginated() throws SQLException {
		return PromotionDAO.getInstance().getPaginated();
	}
	public void delete(int id) throws SQLException{
		PromotionDAO.getInstance().delete(id);
	}
	public void update(Promotion promotion) throws SQLException{
		PromotionDAO.getInstance().update(promotion);
	}
}
