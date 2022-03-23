package com.samsoum.newro.binding.front.dto;

import java.util.Objects;

public class PromotionDTO {
	private int id;
	private String name;
	public PromotionDTO(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public int hashCode() {
		return Objects.hash(id, name);
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
		PromotionDTO other = (PromotionDTO) obj;
		return id == other.id && Objects.equals(name, other.name);
	}
	@Override
	public String toString() {
		return "[" + id + " \\t  " + name + "]";
	}
}