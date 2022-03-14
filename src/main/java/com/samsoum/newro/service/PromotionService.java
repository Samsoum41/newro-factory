package com.samsoum.newro.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.persistence.PromotionDao;

@Service
public class PromotionService {
	private PromotionDao dao;
	
	@Autowired
	private PromotionService(PromotionDao dao) {
		this.dao = dao;
	}
	public void add(Promotion data) throws ServiceException {
		dao.add(data);
	}
	public Optional<Promotion> getOne(int id) throws ServiceException {
		return dao.getById(id);
	}
	public List<Promotion> getAll() {
		return dao.getAll();
	}
	public void delete(int id) throws ServiceException {
		dao.delete(id);
	}
	public void update(Promotion promotion) throws ServiceException {
		dao.update(promotion);
	}
}
