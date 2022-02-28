package com.samsoum.newro.validator;

import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeParseException;

import com.samsoum.newro.dto.StagiaireDTO;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.ServiceException;
import com.samsoum.newro.validator.exception.DepartureBeforeArrivalInputException;
import com.samsoum.newro.validator.exception.EmptyInputException;
import com.samsoum.newro.validator.exception.InputException;
import com.samsoum.newro.validator.exception.NoIntegerInputException;
import com.samsoum.newro.validator.exception.NotValidDateFormatInputException;
import com.samsoum.newro.validator.exception.OutOfBoundsDateInputException;
import com.samsoum.newro.validator.exception.PromotionNotFoundInputException;

public class StagiaireValidateur {
	private static StagiaireValidateur instance;
	private LocalDate LIMIT_DOWN_MYSQL_TIMESTAMP = LocalDate.of(1970, Month.JANUARY, 1);
	private LocalDate LIMIT_UP_MYSQL_TIMESTAMP = LocalDate.of(2038, Month.JANUARY, 19);

	private StagiaireValidateur() {
	}

	public static StagiaireValidateur getInstance() {
		if (instance == null) {
			instance = new StagiaireValidateur();
		}
		return instance;
	}

	public void check(StagiaireDTO stagiaire) throws InputException {
		// Validation du prénom
		checkFirstName(stagiaire.getFirst_name());
		// Validation du nom
		checkLastName(stagiaire.getLast_name());
		// Validation de la date d'arrivée
		checkArrival(stagiaire.getArrival());
		// Validation de la date de départ
		checkFormationOver(stagiaire.getFormation_over(), stagiaire.getArrival());
		// Validation de la promotion
		checkPromotion(stagiaire.getPromotion_id());
	}

	private void checkFirstName(String first_name) throws EmptyInputException {
		checkEmptyString(first_name);
	}

	private void checkLastName(String last_name) throws EmptyInputException {
		checkEmptyString(last_name);
	}

	private void checkEmptyString(String str) throws EmptyInputException {
		if (str.equals("")) {
			throw new EmptyInputException();
		}
	}

	private void checkPromotion(String promotion_id) throws InputException {
		checkEmptyString(promotion_id);
		try {
			int id = Integer.parseInt(promotion_id);
			try {
				if (PromotionService.getInstance().getOne(id) == null) {
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
			LocalDate formation_over = checkDateFormat(formationOverString);
			LocalDate arrival = checkDateFormat(arrivalString);
			if (formation_over.isBefore(arrival)) {
				throw new DepartureBeforeArrivalInputException();
			}
		} catch (EmptyInputException e) {
			throw new EmptyInputException();
		}
	}
}
