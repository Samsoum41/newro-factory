package com.samsoum.newro.mapper;

public class StagiaireFieldMapper {
	private static StagiaireFieldMapper instance;

	private StagiaireFieldMapper() {
		
	}

	public static StagiaireFieldMapper getInstance() {
		if (instance == null) {
			instance = new StagiaireFieldMapper();
		}
		return instance;
	}
}
