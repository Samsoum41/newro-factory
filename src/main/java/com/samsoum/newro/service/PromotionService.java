package com.samsoum.newro.service;

import java.util.List;
import java.util.Optional;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.PromotionDAO;

public class PromotionService {
	private PromotionDAO dao;
	
	private PromotionService(PromotionDAO dao) {
		this.dao = dao;
	}
	
	public List<Promotion> getAll() throws ServiceException {
		try {
			return dao.getAll();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	public void add(Promotion data) throws ServiceException {
		try {
			dao.add(data);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	public Optional<Promotion> getOne(int id) throws ServiceException {
		try {
			return dao.getOne(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	/*
	public List<Promotion> getPaginated() throws ServiceException {
		try {
			return dao.getPaginated();
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	*/
	
	public void delete(int id) throws ServiceException{
		try {
			dao.delete(id);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
	public void update(Promotion promotion) throws ServiceException{
		try {
			dao.update(promotion);
		} catch (DAOException e) {
			throw new ServiceException();
		}
	}
}
