package com.samsoum.newro.model;

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
