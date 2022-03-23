package com.samsoum.newro.model;

import java.time.LocalDate;
import java.util.Objects;

public class Stagiaire {
	private int id;
	private String firstName;
	private String lastName;
	private LocalDate arrival;
	private LocalDate formationOver;
	private Promotion promotion;

	public Stagiaire(int id, String firstName, String lastName, LocalDate arrival, LocalDate formationOver,
			Promotion promotion) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.arrival = arrival;
		this.formationOver = formationOver;
		this.promotion = promotion;
	}

	public Stagiaire(String firstName, String lastName, LocalDate arrival, LocalDate formationOver,
			Promotion promotion) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.arrival = arrival;
		this.formationOver = formationOver;
		this.promotion = promotion;
	}

	@Override
	public int hashCode() {
		return Objects.hash(arrival, firstName, formationOver, id, lastName, promotion);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Stagiaire other = (Stagiaire) obj;
		return Objects.equals(arrival, other.arrival) && Objects.equals(firstName, other.firstName)
				&& Objects.equals(formationOver, other.formationOver) && id == other.id
				&& Objects.equals(lastName, other.lastName) && Objects.equals(promotion, other.promotion);
	}

	@Override
	public String toString() {
		return "[" + id + " \\t  " + firstName + " \\t  " + lastName + " \\t  " + arrival + " \\t  " + formationOver
				+ " \\t  " + promotion + "]";
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

	public Promotion getPromotion() {
		return promotion;
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}

	public int getPromotion_id() {
		return promotion.getId();
	}
}
