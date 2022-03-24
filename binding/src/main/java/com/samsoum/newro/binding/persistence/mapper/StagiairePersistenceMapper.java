package com.samsoum.newro.binding.persistence.mapper;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.persistence.dto.PromotionEntity;
import com.samsoum.newro.binding.persistence.dto.StagiaireEntity;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;

@Component
public class StagiairePersistenceMapper {
	private PromotionPersistenceMapper promotionMapper;
	
	@Autowired
	private StagiairePersistenceMapper(PromotionPersistenceMapper promotionMapper) {
		this.promotionMapper = promotionMapper;
	}
	public Stagiaire toModel(StagiaireEntity stagiaireEntity) {
		// TODO : Validation
		
		// Mapping
		int id = stagiaireEntity.getId();
		String firstName = stagiaireEntity.getFirstName();
		String lastName = stagiaireEntity.getLastName();
		LocalDate arrival = stagiaireEntity.getArrival();
		LocalDate formationOver = stagiaireEntity.getFormationOver();
		Promotion promotion = promotionMapper.toModel(stagiaireEntity.getPromotion());
		return new Stagiaire(id, firstName, lastName, arrival, formationOver, promotion);
	}
	
	public StagiaireEntity toEntity(Stagiaire stagiaire) {
		// TODO : Validation
		
		// Mapping
		int id = stagiaire.getId();
		String firstName = stagiaire.getFirstName();
		String lastName = stagiaire.getLastName();
		LocalDate arrival = stagiaire.getArrival();
		LocalDate formationOver = stagiaire.getFormationOver();
		PromotionEntity promotion = promotionMapper.toEntity(stagiaire.getPromotion());
		return new StagiaireEntity(id, firstName, lastName, arrival, formationOver, promotion);
	}
}
