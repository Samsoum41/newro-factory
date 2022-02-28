package com.samsoum.newro.mapper;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.samsoum.newro.model.Promotion;

public class PromotionMapper {
	private static PromotionMapper instance;
	
	private PromotionMapper() {
		
	}
	
	public Promotion toModel(ResultSet res) throws MapperException {
		// TODO : Remplacer les instructions ternaires par des Optionals
		try {
			return new Promotion(res.getInt("id"), res.getString("name"));
		}
		catch(SQLException e) {
			throw new MapperException();
		}
	}
	
	public PreparedStatement toStatement(Promotion promotion, PreparedStatement statement) throws MapperException {
		try {
			statement.setString(1, promotion.getName());
			return statement;		}
		catch(SQLException e) {
			throw new MapperException();
		}
	}
	public static PromotionMapper getInstance() {
		if(instance == null) {
			instance = new PromotionMapper();
		}
		return instance;
	}
	
	public PreparedStatement toUpdateStatement(Promotion promotion, PreparedStatement statement) throws MapperException {
		try {
			statement.setString(1, promotion.getName());
			statement.setInt(2, promotion.getId());
			return statement;		}
		catch(SQLException e) {
			throw new MapperException();
		}
	}
}
