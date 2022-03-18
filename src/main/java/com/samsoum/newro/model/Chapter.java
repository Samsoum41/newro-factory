package com.samsoum.newro.model;

import java.util.Objects;

public class Chapter {
	private int id;
	private String name;
	private String parent_path;

	public String getParent_path() {
		return parent_path;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Chapter [id=" + id + ", name=" + name + ", parent_path=" + parent_path + "]";
	}

	public Chapter(int id, String name, String parent_path) {
		super();
		this.id = id;
		this.name = name;
		this.parent_path = parent_path;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name, parent_path);
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
		Chapter other = (Chapter) obj;
		return id == other.id && Objects.equals(name, other.name) && Objects.equals(parent_path, other.parent_path);
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

	public void setParent_path(String parent_path) {
		this.parent_path = parent_path;
	}

}
