package com.samsoum.newro.dto;

import java.util.Objects;

public class StagiaireDTO {
	private String first_name;
	private String last_name;
	private String arrival;
	private String formation_over;
	@Override
	public int hashCode() {
		return Objects.hash(arrival, first_name, formation_over, last_name);
	}
	public StagiaireDTO(String first_name, String last_name, String arrival, String formation_over) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.arrival = arrival;
		this.formation_over = formation_over;
	}
	@Override
	public String toString() {
		return "[" + first_name + " \\t  " + last_name + " \\t  " + arrival + " \\t  " + formation_over + "]";
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StagiaireDTO other = (StagiaireDTO) obj;
		return Objects.equals(arrival, other.arrival) && Objects.equals(first_name, other.first_name)
				&& Objects.equals(formation_over, other.formation_over) && Objects.equals(last_name, other.last_name);
	}
	public String getFirst_name() {
		return first_name;
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
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	public String getFormation_over() {
		return formation_over;
	}
	public void setFormation_over(String formation_over) {
		this.formation_over = formation_over;
	}
}
