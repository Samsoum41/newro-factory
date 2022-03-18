package com.samsoum.newro.dto;

import java.util.Objects;

public class StagiaireDTOWithId extends StagiaireDTO {
	private int id;

	public StagiaireDTOWithId(int id, String firstName, String lastName, String arrival, String formationOver,
			String promotionId) {
		super(firstName, lastName, arrival, formationOver, promotionId);
		this.id = id;
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
}
