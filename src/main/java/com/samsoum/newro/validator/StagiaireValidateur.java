package com.samsoum.newro.validator;

import com.samsoum.newro.dto.StagiaireDTO;
import com.samsoum.newro.validator.exception.NoIntegerInputException;

public class StagiaireValidateur {
	public void check(StagiaireDTO stagiaire) {
		
	}
	private void checkId(String idDTO) throws NoIntegerInputException {
		if(Integer.class.isInstance(idDTO)) {
			throw new NoIntegerInputException();
		}
		else {
			// TODO : Tout revoir après avoir fait les exceptions côté DAO et Service, puis après avoir créé des DTO
			Integer id = Integer.parseInt(idDTO);
			//StagiaireService.getInstance().getOne(id);
		}
	}
}
