package com.samsoum.newro.model;

import java.util.Objects;

public class Promotion {
	private int id;
	private String name;

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Promotion [id=" + id + ", name=" + name + "]";
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Promotion other = (Promotion) obj;
		return id == other.id && Objects.equals(name, other.name);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Promotion(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

}
