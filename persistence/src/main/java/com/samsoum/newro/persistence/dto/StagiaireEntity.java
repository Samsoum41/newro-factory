package com.samsoum.newro.persistence.dto;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity(name = "stagiaire")
public class StagiaireEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Basic
	@NotNull
	@Column(name = "first_name")
	private String firstName;

	@Basic
	@NotNull
	@Column(name = "last_name")
	private String lastName;

	@Column(name = "arrival")
	@NotNull
	private LocalDate arrival;

	@Column(name = "formation_over")
	private LocalDate formationOver;

	@NotNull
	@ManyToOne(targetEntity = PromotionEntity.class)
	private PromotionEntity promotion;
	
	

	public StagiaireEntity() {
		super();
	}

	public StagiaireEntity(String firstName, String lastName, LocalDate arrival, PromotionEntity promotion) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.arrival = arrival;
		this.promotion = promotion;
	}

	public StagiaireEntity(int id, String firstName, String lastName, LocalDate arrival, LocalDate formationOver, PromotionEntity promotion) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.arrival = arrival;
		this.formationOver = formationOver;
		this.promotion = promotion;
	}

	public StagiaireEntity(String firstName, String lastName, LocalDate arrival, LocalDate formationOver, PromotionEntity promotion) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.arrival = arrival;
		this.formationOver = formationOver;
		this.promotion = promotion;
	}

	@Override
	public String toString() {
		return id + " \t  " + firstName + " \t  " + lastName + " \t  " + arrival + " \t  " + formationOver + " \t  "
				+ promotion;
	}

	@Override
	public int hashCode() {
		return Objects.hash(arrival, firstName, formationOver, id, lastName, promotion);
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
		StagiaireEntity other = (StagiaireEntity) obj;
		return Objects.equals(arrival, other.arrival) && Objects.equals(firstName, other.firstName)
				&& Objects.equals(formationOver, other.formationOver) && id == other.id
				&& Objects.equals(lastName, other.lastName) && Objects.equals(promotion, other.promotion);
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

	public PromotionEntity getPromotion() {
		return promotion;
	}

	public void setPromotion(PromotionEntity promotion) {
		this.promotion = promotion;
	}

	// Bonus celui-là
	public int getPromotionId() {
		return promotion.getId();
	}
}
