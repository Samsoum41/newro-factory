package com.samsoum.newro.binding.front.dto;

import java.time.LocalDate;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;

public class StagiaireDTO {
	private String firstName;
	private String lastName;
	@DateTimeFormat(iso=DateTimeFormat.ISO.DATE)
	private LocalDate arrival;
	@DateTimeFormat(iso=DateTimeFormat.ISO.DATE)
	private LocalDate formationOver;
	private PromotionDTO promotion;

	public StagiaireDTO(String firstName, String lastName, LocalDate arrival, LocalDate formationOver, PromotionDTO promotion) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.arrival = arrival;
		this.formationOver = formationOver;
		this.promotion = promotion;
	}

	@Override
	public int hashCode() {
		return Objects.hash(arrival, firstName, formationOver, lastName, promotion);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		StagiaireDTO other = (StagiaireDTO) obj;
		return Objects.equals(arrival, other.arrival) && Objects.equals(firstName, other.firstName)
				&& Objects.equals(formationOver, other.formationOver) && Objects.equals(lastName, other.lastName)
				&& Objects.equals(promotion, other.promotion);
	}



	@Override
	public String toString() {
		return "[" + firstName + " \\t  " + lastName + " \\t  " + arrival + " \\t  " + formationOver + " \\t  "
				+ promotion + "]";
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getArrival() {
		return arrival;
	}

	public void setArrival(LocalDate arrival) {
		this.arrival = arrival;
	}

	public LocalDate getFormationOver() {
		return formationOver;
	}

	public void setFormationOver(LocalDate formationOver) {
		this.formationOver = formationOver;
	}

	public PromotionDTO getPromotion() {
		return promotion;
	}

	public void setPromotion(PromotionDTO promotion) {
		this.promotion = promotion;
	}
}
