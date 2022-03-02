package com.samsoum.newro.service;

import java.util.List;
import java.util.Optional;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.persistence.DAOException;
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

	//TODO : Méthode mal faite au niveau des exceptions
	public static boolean doesExist(int id) {
		try {
			PromotionDAO.getInstance().getOne(id);
			return true;
		}
		catch(DAOException e) {
			return false;
		}
	}		
	public List<Promotion> getAll() throws ServiceException {
		try {
			return PromotionDAO.getInstance().getAll();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	public void add(Promotion data) throws ServiceException {
		try {
			PromotionDAO.getInstance().add(data);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	public Optional<Promotion> getOne(int id) throws ServiceException {
		try {
			return PromotionDAO.getInstance().getOne(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	/*
	public List<Promotion> getPaginated() throws ServiceException {
		try {
			return PromotionDAO.getInstance().getPaginated();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	*/
	
	public void delete(int id) throws ServiceException{
		try {
			PromotionDAO.getInstance().delete(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	public void update(Promotion promotion) throws ServiceException{
		try {
			PromotionDAO.getInstance().update(promotion);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
}
