package com.samsoum.newro.mapper;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.persistence.dto.PromotionEntity;

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
