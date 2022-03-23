package com.samsoum.newro.validator;

import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.samsoum.newro.binding.front.dto.StagiaireDTO;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.ServiceException;
import com.samsoum.newro.validator.exception.DepartureBeforeArrivalInputException;
import com.samsoum.newro.validator.exception.EmptyInputException;
import com.samsoum.newro.validator.exception.InputException;
import com.samsoum.newro.validator.exception.NoIntegerInputException;
import com.samsoum.newro.validator.exception.NotValidDateFormatInputException;
import com.samsoum.newro.validator.exception.OutOfBoundsDateInputException;
import com.samsoum.newro.validator.exception.PromotionNotFoundInputException;

@Component
public class StagiaireValidateur {
	private PromotionService promotionService;
	private LocalDate LIMIT_DOWN_MYSQL_TIMESTAMP = LocalDate.of(1970, Month.JANUARY, 1);
	private LocalDate LIMIT_UP_MYSQL_TIMESTAMP = LocalDate.of(2038, Month.JANUARY, 19);

	@Autowired
	private StagiaireValidateur(PromotionService promotionService) {
		this.promotionService = promotionService;
	}


	public void check(StagiaireDTO stagiaire) throws InputException {
		checkFirstName(stagiaire.getFirst_name());
		checkLastName(stagiaire.getLast_name());
		checkArrival(stagiaire.getArrival());
		checkFormationOver(stagiaire.getFormation_over(), stagiaire.getArrival());
		checkPromotion(stagiaire.getPromotion_id());
	}

	private void checkFirstName(String firstName) throws EmptyInputException {
		checkEmptyString(firstName);
	}

	private void checkLastName(String lastName) throws EmptyInputException {
		checkEmptyString(lastName); 
	}

	private void checkEmptyString(String str) throws EmptyInputException {
		if (str.equals("")) {
			throw new EmptyInputException();
		}
	}

	private void checkPromotion(String promotionId) throws InputException {
		checkEmptyString(promotionId);
		try {
			int id = Integer.parseInt(promotionId);
			try {
				if (!promotionService.getOne(id).isPresent()) {
					throw new PromotionNotFoundInputException();
				}
			} catch (ServiceException e) {
				throw new InputException();
			}
		} catch (NumberFormatException e) {
			throw new NoIntegerInputException();
		}
	}

	// It assumes input is not empty
	private LocalDate checkDateFormat(String dateString) throws InputException {
		try {
			LocalDate date = LocalDate.parse(dateString);
			if (date.isBefore(LIMIT_UP_MYSQL_TIMESTAMP) && date.isAfter(LIMIT_DOWN_MYSQL_TIMESTAMP)) {
				return date;
			} else {
				throw new OutOfBoundsDateInputException();
			}
		} catch (DateTimeParseException e) {
			throw new NotValidDateFormatInputException();
		}
	}

	private void checkArrival(String dateString) throws InputException {
		checkEmptyString(dateString);
		checkDateFormat(dateString);
	}

	private void checkFormationOver(String formationOverString, String arrivalString) throws InputException {
		try {
			checkEmptyString(formationOverString);
			LocalDate formationOver = checkDateFormat(formationOverString);
			LocalDate arrival = checkDateFormat(arrivalString);
			if (formationOver.isBefore(arrival)) {
				throw new DepartureBeforeArrivalInputException();
			}
		} catch (EmptyInputException e) {
			throw new EmptyInputException();
		}
	}
}
