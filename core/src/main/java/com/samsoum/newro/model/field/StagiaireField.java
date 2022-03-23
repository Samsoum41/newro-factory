package com.samsoum.newro.model.field;

public enum StagiaireField {
	ID("id"),
	FIRST_NAME("firstName"),
	LAST_NAME("lastName"),
	ARRIVAL("arrival"),
	FORMATION_OVER("formationOver"),
	PROMOTION_ID("promotionId");
	
	private String value;
	
	StagiaireField(String val) {
		this.value = val;
	}
	
	public String getValue() {
		return this.value;
	}
	
	public static StagiaireField valueFromString(String field) {
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
