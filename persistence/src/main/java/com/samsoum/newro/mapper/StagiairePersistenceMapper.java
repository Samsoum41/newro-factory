package com.samsoum.newro.mapper;

import java.time.LocalDate;

import org.springframework.stereotype.Component;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.dto.StagiaireEntity;

@Component
public class StagiairePersistenceMapper {
	private PromotionPersistenceMapper promotionMapper;
	
	private StagiairePersistenceMapper(PromotionPersistenceMapper promotionMapper) {
		this.promotionMapper = promotionMapper;
	}
	public Stagiaire toModel(StagiaireEntity stagiaireEntity) {
		// TODO : Validation
		
		// Mapping
		String firstName = stagiaireEntity.getFirstName();
		String lastName = stagiaireEntity.getLastName();
		LocalDate arrival = stagiaireEntity.getArrival();
		LocalDate formationOver = stagiaireEntity.getFormationOver();
		Promotion promotion = promotionMapper.toModel(stagiaireEntity.getPromotion());
		return new Stagiaire(firstName, lastName, arrival, formationOver, promotion);
	}
}
