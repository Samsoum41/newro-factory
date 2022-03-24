package com.samsoum.newro.binding.front.mapper;

import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.front.dto.PromotionDTO;
import com.samsoum.newro.model.Promotion;

@Component
public class PromotionFrontMapper {
	public Promotion toModel(PromotionDTO promotion) {
		// TODO : Validation
		return new Promotion(promotion.getId(), promotion.getName());
	}
	
	public PromotionDTO toDto(Promotion promotion) {
		return new PromotionDTO(promotion.getId(), promotion.getName());
	}
}
