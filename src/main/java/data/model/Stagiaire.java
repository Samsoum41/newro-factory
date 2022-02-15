package data.model;

import java.time.LocalDate;

public class Stagiaire {
	@Override
	public String toString() {
		return "Stagiaire [id=" + id + ", first_name=" + first_name + ", last_name=" + last_name + ", arrival="
				+ arrival + ", formation_over=" + formation_over + ", promotion_id=" + promotion_id + "]";
	}
	private int id;
	private String first_name;
	private String last_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public Stagiaire(int id, String first_name, String last_name, LocalDate arrival, LocalDate formation_over,
			int promotion_id) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.arrival = arrival;
		this.formation_over = formation_over;
		this.promotion_id = promotion_id;
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
	public int getPromotion_id() {
		return promotion_id;
	}
	public void setPromotion_id(int promotion_id) {
		this.promotion_id = promotion_id;
	}
	private LocalDate arrival;
	private LocalDate formation_over;
	private int promotion_id;
}
