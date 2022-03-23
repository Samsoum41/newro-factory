package com.samsoum.newro.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.samsoum.newro.mapper.StagiairePersistenceMapper;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.model.field.StagiaireField;
import com.samsoum.newro.persistence.dto.StagiaireEntity;
import com.samsoum.newro.persistence.repositories.jpa.StagiaireRepository;

@Service
public class StagiaireService {
//	private static StagiaireService instance;
	private StagiaireRepository dao;
	private StagiairePersistenceMapper stagiairePersistenceMapper;

	@Autowired
	public StagiaireService(StagiaireRepository dao, StagiairePersistenceMapper stagiairePersistenceMapper) {
		this.dao = dao;
		this.stagiairePersistenceMapper = stagiairePersistenceMapper;
	}

	public StagiaireRepository getDao() {
		return dao;
	}

	public void setDao(StagiaireRepository dao) {
		this.dao = dao;
	}

	public void save(Stagiaire data) {
		StagiaireEntity entity = stagiairePersistenceMapper.toEntity(data);
		dao.save(entity);
	}

	public Optional<Stagiaire> findById(int id) {
		Optional<StagiaireEntity> entity = dao.findById(id);
		return entity.map(stagiairePersistenceMapper::toModel);
	}

	public long count() {
		return dao.count();
	}

	public Page<Stagiaire> get(StagiaireField orderField, String filterValue, int page, int rowsPerPage) {
		System.out.println("L'ordre passé ici est : " + orderField);
		Pageable p = PageRequest.of(page, rowsPerPage, Sort.by(orderField.getValue()).ascending());
		Page<StagiaireEntity> pageStagiaire = dao.findByFirstNameContainingOrLastNameContaining(filterValue, p);
		return pageStagiaire.map(stagiairePersistenceMapper::toModel);
	}

	public void delete(int id) {
		dao.deleteById(id);
	}

	public void update(Stagiaire stagiaire) {
		StagiaireEntity entity = stagiairePersistenceMapper.toEntity(stagiaire);
		dao.save(entity);
	}
}
