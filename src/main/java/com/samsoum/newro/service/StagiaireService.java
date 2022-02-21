package com.samsoum.newro.service;

import java.sql.SQLException;
import java.util.List;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.StagiaireDAO;

public class StagiaireService {
	private static StagiaireService instance;
	
	private StagiaireService() {
		
	}
	public static StagiaireService getInstance() {
		if (StagiaireService.instance == null) {
			StagiaireService.instance = new StagiaireService();
		}
		return StagiaireService.instance;
	}
	
	public static boolean doesExist(int id){
		try {
			StagiaireDAO.getInstance().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}
	public List<Stagiaire> getAll() throws SQLException {
		return StagiaireDAO.getInstance().getAll();
	}
	public void add(Stagiaire data) throws SQLException {
		StagiaireDAO.getInstance().add(data);
	}
	public Stagiaire getOne(int id) throws SQLException {
		return StagiaireDAO.getInstance().getOne(id);
	}
	public List<Stagiaire> getPaginated() throws SQLException {
		return StagiaireDAO.getInstance().getPaginated();
	}
	public void delete(int id) throws SQLException{
		StagiaireDAO.getInstance().delete(id);
	}
	public void update(Stagiaire promotion) throws SQLException{
		StagiaireDAO.getInstance().update(promotion);
	}
	public boolean hasNextPage() throws SQLException {
		return StagiaireDAO.getInstance().hasNextPage();
	}
}