package com.samsoum.newro.service;

import java.util.List;
import java.util.Optional;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.StagiaireDAO;
import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.ui.PageStagiaire;

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

	//TODO : Méthode mal faite au niveau des exceptions
	public static boolean doesExist(int id) {
		try {
			StagiaireDAO.getInstance().getOne(id);
			return true;
		} catch (DAOException e) {
			return false;
		}
	}

	public List<Stagiaire> getAll() throws ServiceException {
		try {
			return StagiaireDAO.getInstance().getAll();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public void add(Stagiaire data) throws ServiceException {
		try {
			StagiaireDAO.getInstance().add(data);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public Optional<Stagiaire> getOne(int id) throws ServiceException {
		try {
			return StagiaireDAO.getInstance().getOne(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public int getNumberOfStagiaires() throws ServiceException {
		try {
			return StagiaireDAO.getInstance().getNumberOfStagiaires();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public PageStagiaire getPaginated() throws ServiceException {
		try {
			return StagiaireDAO.getInstance().getPaginated();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public PageStagiaire getPaginated(int page, int rowsPerPage) throws ServiceException {
		try {
			return StagiaireDAO.getInstance().getPaginated(page,rowsPerPage);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	
	public PageStagiaire getPaginated(int page) throws ServiceException {
		try {
			return StagiaireDAO.getInstance().getPaginated(page);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	
	public PageStagiaire getOrderdAndPaginated(StagiaireField field, int page, int rowsPerPage) throws ServiceException{
		try {
			return StagiaireDAO.getInstance().getOrderdAndPaginated(field, page, rowsPerPage);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	public PageStagiaire getOrderdAndPaginatedAndFiltered(StagiaireField orderField, StagiaireField filterField, String filterValue, int page, int rowsPerPage) throws ServiceException {
		try {
			return StagiaireDAO.getInstance().getOrderdAndPaginatedAndFiltered(orderField, filterField, filterValue, page, rowsPerPage);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public void delete(int id) throws ServiceException {
		try {
			StagiaireDAO.getInstance().delete(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public void update(Stagiaire stagiaire) throws ServiceException {
		try {
			StagiaireDAO.getInstance().update(stagiaire);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
}
