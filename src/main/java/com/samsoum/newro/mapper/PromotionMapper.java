package com.samsoum.newro.mapper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.samsoum.newro.model.Promotion;

public class PromotionMapper {
	private static PromotionMapper instance;
	
	private PromotionMapper() {
		
	}
	
	public Promotion toModel(ResultSet res) throws SQLException {
		// TODO : Remplacer les instructions ternaires par des Optionals
		return new Promotion(res.getInt("id"), res.getString("name"));
	}
	
	public PreparedStatement toStatement(Promotion promotion, PreparedStatement statement) throws SQLException {
		statement.setString(1, promotion.getName());
		return statement;
	}
	public static PromotionMapper getInstance() {
		if(instance == null) {
			instance = new PromotionMapper();
		}
		return instance;
	}
}
