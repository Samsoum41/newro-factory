package com.samsoum.newro.service;

import java.util.List;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.DatabaseException;
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
		catch(DatabaseException e) {
			return false;
		}
	}
	public List<Stagiaire> getAll() throws DatabaseException {
		return StagiaireDAO.getInstance().getAll();
	}
	public void add(Stagiaire data) throws DatabaseException {
		StagiaireDAO.getInstance().add(data);
	}
	public Stagiaire getOne(int id) throws DatabaseException {
		return StagiaireDAO.getInstance().getOne(id);
	}
	public int getNumberOfStagiaires() throws DatabaseException {
		return StagiaireDAO.getInstance().getNumberOfStagiaires();
	}
	public int getNumberOfPages() throws DatabaseException {
		int nbStagiaires =  StagiaireService.getInstance().getNumberOfStagiaires();
		return (nbStagiaires/StagiaireDAO.getInstance().getRowsPerPage())+1;
	}
	public List<Stagiaire> getPaginated() throws DatabaseException {
		return StagiaireDAO.getInstance().getPaginated();
	}
	public List<Stagiaire> getPaginated(int page) throws DatabaseException {
		return StagiaireDAO.getInstance().getPaginated(page);
	}
	public void delete(int id) throws DatabaseException{
		StagiaireDAO.getInstance().delete(id);
	}
	public void update(Stagiaire promotion) throws DatabaseException{
		StagiaireDAO.getInstance().update(promotion);
	}
	public boolean hasNextPage() throws DatabaseException {
		return StagiaireDAO.getInstance().hasNextPage();
	}
	public int getRowsPerPage() {
		return StagiaireDAO.getInstance().getRowsPerPage();
	}
	public void setRowsPerPage(int numOfRows) {
		StagiaireDAO.getInstance().setRowsPerPage(numOfRows);
	}
}
