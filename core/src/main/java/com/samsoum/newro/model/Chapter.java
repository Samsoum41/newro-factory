package com.samsoum.newro.model;

import java.util.Objects;

public class Chapter {
	private int id;
	private String name;
	private String parentPath;

	public String getParent_path() {
		return parentPath;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Chapter [id=" + id + ", name=" + name + ", parent_path=" + parentPath + "]";
	}

	public Chapter(int id, String name, String parentPath) {
		super();
		this.id = id;
		this.name = name;
		this.parentPath = parentPath;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, name, parentPath);
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
		return id == other.id && Objects.equals(name, other.name) && Objects.equals(parentPath, other.parentPath);
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
		this.parentPath = parent_path;
	}

}
