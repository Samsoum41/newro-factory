package com.samsoum.newro.mapper;

import org.springframework.stereotype.Component;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.persistence.dto.PromotionEntity;

@Component
public class PromotionPersistenceMapper {
	public Promotion toModel(PromotionEntity promotionEntity) {
		// TODO : Validation
		
		// Mapping
		return new Promotion(promotionEntity.getId(), promotionEntity.getName());
	}
	
	public PromotionEntity toEntity(Promotion promotion) {
		// TODO : Validation
		
		// Mapping
		return new PromotionEntity(promotion.getId(), promotion.getName());
	}
}
