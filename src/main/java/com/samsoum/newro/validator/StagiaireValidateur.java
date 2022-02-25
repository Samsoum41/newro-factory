package com.samsoum.newro.validator;

import com.samsoum.newro.service.StagiaireService;
import com.samsoum.newro.validator.exception.NoIntegerInputException;

public class StagiaireValidateur {
	public void check() {
		
	}
	private void checkId(Object a) throws NoIntegerInputException {
		if(Integer.class.isInstance(a)) {
			throw new NoIntegerInputException();
		}
		else {
			// TODO : Tout revoir après avoir fait les exceptions côté DAO et Service, puis après avoir créé des DTO
			Integer id = (Integer)a;
			//StagiaireService.getInstance().getOne(id);
		}
	}
}
