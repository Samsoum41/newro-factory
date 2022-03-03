package com.samsoum.newro.persistence;

public enum StagiaireField {
	ID("id"),
	FIRST_NAME("first_name"),
	LAST_NAME("last_name"),
	ARRIVAL("arrival"),
	FORMATION_OVER("formation_over"),
	PROMOTION_ID("promotion_id");
	
	private String value;
	private StagiaireField(String val) {
		this.value = val;
	}
	public String getValue() {
		return this.value;
	}
}
