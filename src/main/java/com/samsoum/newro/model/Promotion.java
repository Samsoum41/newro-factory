package com.samsoum.newro.model;

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
