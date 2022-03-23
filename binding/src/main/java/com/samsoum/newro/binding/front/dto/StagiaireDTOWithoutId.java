package com.samsoum.newro.binding.front.dto;

import java.time.LocalDate;

public class StagiaireDTOWithoutId extends StagiaireDTO  {
	public StagiaireDTOWithoutId(String firstName, String lastName, LocalDate arrival, LocalDate formationOver,
			PromotionDTO promotion) {
		super(firstName, lastName, arrival, formationOver, promotion);
	}
}
