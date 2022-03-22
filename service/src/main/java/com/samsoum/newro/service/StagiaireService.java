package com.samsoum.newro.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.StagiaireDao;
import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.ui.PageStagiaire;

@Service
public class StagiaireService {
//	private static StagiaireService instance;
	private StagiaireDao dao;

	@Autowired
	public StagiaireService(StagiaireDao dao) {
		this.dao = dao;
	}

	public StagiaireDao getDao() {
		return dao;
	}

	public void setDao(StagiaireDao dao) {
		this.dao = dao;
	}

	public void add(Stagiaire data) {
		dao.add(data);
	}

	public Optional<Stagiaire> getOne(int id) {
		return dao.getById(id);
	}

	public int count() {
		return dao.count();
	}

	public PageStagiaire get(StagiaireField orderField, StagiaireField filterField,
			String filterValue, int page, int rowsPerPage) {
		System.out.println(orderField);
		return dao.get(orderField, filterField, filterValue, page, rowsPerPage);

	}

	public void delete(int id) {
		dao.delete(id);
	}

	public void update(Stagiaire stagiaire) {
		dao.update(stagiaire);
	}
}
