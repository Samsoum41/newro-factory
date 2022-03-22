package com.samsoum.newro.persistence;

public enum StagiaireField {
	ID("id"),
	FIRST_NAME("first_name"),
	LAST_NAME("last_name"),
	ARRIVAL("arrival"),
	FORMATION_OVER("formation_over"),
	PROMOTION_ID("promotion_id");
	
	private String value;
	StagiaireField(String val) {
		this.value = val;
	}
	public String getValue() {
		return this.value;
	}
	public static StagiaireField valueFromSnakeCase(String field) {
		StagiaireField result;
		switch (field) {
		case "firstName":
			result = StagiaireField.FIRST_NAME;
			break;
		case "lastName":
			result = StagiaireField.LAST_NAME;
			break;
		case "arrival":
			result = StagiaireField.ARRIVAL;
			break;
		case "formationOver":
			result = StagiaireField.FORMATION_OVER;
			break;
		case "promotion":
			result = StagiaireField.PROMOTION_ID;
			break;
		default:
			result = StagiaireField.FIRST_NAME;
			break;
		}
		return result;
	}
}
