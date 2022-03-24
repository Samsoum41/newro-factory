package com.samsoum.newro.binding.front.mapper;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.front.dto.PromotionDTO;
import com.samsoum.newro.binding.front.dto.StagiaireDTOWithId;
import com.samsoum.newro.binding.front.dto.StagiaireDTOWithoutId;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;

@Component
public class StagiaireFrontMapper {
	private PromotionFrontMapper promotionMapper;
	
	@Autowired
	private StagiaireFrontMapper(PromotionFrontMapper promotionMapper) {
		this.promotionMapper = promotionMapper;
	}
	
	public StagiaireDTOWithId toDto(Stagiaire stagiaire) {
		int id = stagiaire.getId();
		String firstName = stagiaire.getFirstName();
		String lastName = stagiaire.getLastName();
		LocalDate arrival = stagiaire.getArrival();
		LocalDate formationOver = stagiaire.getFormationOver();
		PromotionDTO promotion = promotionMapper.toDto(stagiaire.getPromotion());
		return new StagiaireDTOWithId(id, firstName, lastName, arrival, formationOver, promotion);
	}
	public Stagiaire toModel(StagiaireDTOWithoutId stagiaire) {
		// TODO : enlever la validation côté front du back et la mettre ici
		
		// Mapping
		String firstName = stagiaire.getFirstName();
		String lastName = stagiaire.getLastName();
		LocalDate arrival = stagiaire.getArrival();
		LocalDate formationOver = stagiaire.getFormationOver();
		Promotion promotion = promotionMapper.toModel(stagiaire.getPromotion());
		return new Stagiaire(firstName, lastName, arrival, formationOver, promotion);
	}
	public Stagiaire toModel(StagiaireDTOWithId stagiaire) {
		// TODO : enlever la validation côté front du back et la mettre ici
		
		// Mapping
		int id = stagiaire.getId();
		String firstName = stagiaire.getFirstName();
		String lastName = stagiaire.getLastName();
		LocalDate arrival = stagiaire.getArrival();
		LocalDate formationOver = stagiaire.getFormationOver();
		Promotion promotion = promotionMapper.toModel(stagiaire.getPromotion());
		return new Stagiaire(id, firstName, lastName, arrival, formationOver, promotion);
	}
}
