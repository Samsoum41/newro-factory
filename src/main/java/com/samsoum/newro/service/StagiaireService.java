package com.samsoum.newro.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.StagiaireDAO;
import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.ui.PageStagiaire;

@Service
public class StagiaireService {
//	private static StagiaireService instance;
	private StagiaireDAO dao;

	@Autowired
	public StagiaireService(StagiaireDAO dao) {
		this.dao = dao;
	}

//
//	public static StagiaireService getInstance() {
//		if (StagiaireService.instance == null) {
//			StagiaireService.instance = new StagiaireService();
//		}
//		return StagiaireService.instance;
//	}

	//TODO : Méthode mal faite au niveau des exceptions
//	public static boolean doesExist(int id) {
//		try {
//			dao.getOne(id);
//			return true;
//		} catch (DAOException e) {
//			return false;
//		}
//	}

	public StagiaireDAO getDao() {
		return dao;
	}

	public void setDao(StagiaireDAO dao) {
		this.dao = dao;
	}

	public List<Stagiaire> getAll() throws ServiceException {
		try {
			return dao.getAll();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public void add(Stagiaire data) throws ServiceException {
		try {
			dao.add(data);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public Optional<Stagiaire> getOne(int id) throws ServiceException {
		try {
			return dao.getOne(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public int getNumberOfStagiaires() throws ServiceException {
		try {
			return dao.getNumberOfStagiaires();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public PageStagiaire getOrderdAndPaginatedAndFiltered(StagiaireField orderField, StagiaireField filterField, String filterValue, int page, int rowsPerPage) throws ServiceException {
		try {
			return dao.getOrderdAndPaginatedAndFiltered(orderField, filterField, filterValue, page, rowsPerPage);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public void delete(int id) throws ServiceException {
		try {
			dao.delete(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}

	public void update(Stagiaire stagiaire) throws ServiceException {
		try {
			dao.update(stagiaire);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
}
