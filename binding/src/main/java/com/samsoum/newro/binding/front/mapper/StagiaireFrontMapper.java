package com.samsoum.newro.binding.front.mapper;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.front.dto.StagiaireDTO;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;

@Component
public class StagiaireFrontMapper {
	private PromotionFrontMapper promotionMapper;
	
	@Autowired
	private StagiaireFrontMapper(PromotionFrontMapper promotionMapper) {
		this.promotionMapper = promotionMapper;
	}
	public Stagiaire toModel(StagiaireDTO stagiaire) {
		// TODO : enlever la validation côté front du back et la mettre ici
		
		// Mapping
		String firstName = stagiaire.getFirstName();
		String lastName = stagiaire.getLastName();
		LocalDate arrival = stagiaire.getArrival();
		LocalDate formationOver = stagiaire.getFormationOver();
		Promotion promotion = promotionMapper.toModel(stagiaire.getPromotion());
		return new Stagiaire(firstName, lastName, arrival, formationOver, promotion);
	}
}
