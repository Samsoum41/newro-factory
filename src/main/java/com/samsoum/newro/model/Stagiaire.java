package com.samsoum.newro.model;

import java.time.LocalDate;
import java.util.Objects;

public class Stagiaire {
	private int id;
	private String first_name;
	private String last_name;
	private LocalDate arrival;
	private LocalDate formation_over;
	private Promotion promotion;

	public Stagiaire(String first_name, String last_name, LocalDate arrival, Promotion promotion) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.arrival = arrival;
		this.promotion = promotion;
	}

	public Stagiaire(int id, String first_name, String last_name, LocalDate arrival, LocalDate formation_over,
			Promotion promotion) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.arrival = arrival;
		this.formation_over = formation_over;
		this.promotion = promotion;
	}

	public Stagiaire(String first_name, String last_name, LocalDate arrival, LocalDate formation_over,
			Promotion promotion) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.arrival = arrival;
		this.formation_over = formation_over;
		this.promotion = promotion;
	}

	@Override
	public String toString() {
		return id + " \t  " + first_name + " \t  " + last_name + " \t  " + arrival + " \t  " + formation_over + " \t  "
				+ promotion;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirst_name() {
		return first_name;
	}

	@Override
	public int hashCode() {
		return Objects.hash(arrival, first_name, formation_over, id, last_name, promotion);
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
		return Objects.equals(arrival, other.arrival) && Objects.equals(first_name, other.first_name)
				&& Objects.equals(formation_over, other.formation_over) && id == other.id
				&& Objects.equals(last_name, other.last_name) && Objects.equals(promotion, other.promotion);
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public LocalDate getArrival() {
		return arrival;
	}

	public void setArrival(LocalDate arrival) {
		this.arrival = arrival;
	}

	public LocalDate getFormation_over() {
		return formation_over;
	}

	public void setFormation_over(LocalDate formation_over) {
		this.formation_over = formation_over;
	}

	public Promotion getPromotion() {
		return promotion;
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}
}
