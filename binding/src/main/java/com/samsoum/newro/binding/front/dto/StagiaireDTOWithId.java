package com.samsoum.newro.binding.front.dto;

import java.time.LocalDate;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;

public class StagiaireDTOWithId {
	private int id;
	private String firstName;
	private String lastName;
	@DateTimeFormat(iso=DateTimeFormat.ISO.DATE)
	private LocalDate arrival;
	@DateTimeFormat(iso=DateTimeFormat.ISO.DATE)
	private LocalDate formationOver;
	private PromotionDTO promotion;

	public StagiaireDTOWithId(int id, String firstName, String lastName, LocalDate arrival, LocalDate formationOver, PromotionDTO promotion) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.arrival = arrival;
		this.formationOver = formationOver;
		this.promotion = promotion;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(id);
		return result;
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
		StagiaireDTOWithId other = (StagiaireDTOWithId) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "[" + id + "]" + super.toString();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
