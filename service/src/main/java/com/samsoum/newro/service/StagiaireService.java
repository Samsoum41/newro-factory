package com.samsoum.newro.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.StagiaireRepository;
import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.persistence.repositories.jpa.StagiaireRepository;
import com.samsoum.newro.ui.PageStagiaire;

@Service
public class StagiaireService {
//	private static StagiaireService instance;
	private StagiaireRepository dao;

	@Autowired
	public StagiaireService(StagiaireRepository dao) {
		this.dao = dao;
	}

	public StagiaireRepository getDao() {
		return dao;
	}

	public void setDao(StagiaireRepository dao) {
		this.dao = dao;
	}

	public void save(Stagiaire data) {
		dao.save(data);
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
