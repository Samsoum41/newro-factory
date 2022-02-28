package com.samsoum.newro.mapper;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.ServiceException;

public class StagiaireMapper {
	private static StagiaireMapper instance;
	
	private StagiaireMapper() {
		
	}
	
	public Stagiaire toModel(ResultSet res) throws MapperException {
		// TODO : Remplacer les instructions ternaires par des Optionals
		try {
			LocalDate arrival = res.getDate("arrival") == null  ? null : res.getDate("arrival").toLocalDate();
			LocalDate formation_over = res.getDate("formation_over") == null ? null : res.getDate("arrival").toLocalDate();
			Promotion stagiairePromotion = PromotionService.getInstance().getOne(res.getInt("promotion_id"));
			return new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival, formation_over, stagiairePromotion);
		}
		catch (SQLException | ServiceException e) {
			throw new MapperException();
		}
	}
	
	public PreparedStatement toStatement(Stagiaire stagiaire, PreparedStatement statement) throws MapperException {
		Timestamp arrival = stagiaire.getArrival() == null  ? null : Timestamp.valueOf(stagiaire.getArrival().atStartOfDay());
		Timestamp formation_over = stagiaire.getFormation_over() == null ? null : Timestamp.valueOf(stagiaire.getFormation_over().atStartOfDay());
		try {
			statement.setString(1, stagiaire.getFirst_name());
			statement.setString(2, stagiaire.getLast_name());
			statement.setTimestamp(3, arrival);
			statement.setTimestamp(4, formation_over);
			statement.setInt(5, stagiaire.getPromotion().getId());
			return statement;
		}
		catch (SQLException  e) {
			throw new MapperException();
		}

	}
	public static StagiaireMapper getInstance() {
		if(instance == null) {
			instance = new StagiaireMapper();
		}
		return instance;
	}
	public PreparedStatement toUpdateStatement(Stagiaire stagiaire, PreparedStatement statement) throws MapperException {
		Date arrival = stagiaire.getArrival() == null ? null : Date.valueOf(stagiaire.getArrival());
		Date formation_over = stagiaire.getFormation_over() == null ? null : Date.valueOf(stagiaire.getFormation_over());
		try {
			statement.setString(1, stagiaire.getFirst_name());
			statement.setString(2, stagiaire.getLast_name());
			statement.setDate(3, arrival);
			statement.setDate(4, formation_over);
			statement.setInt(5, stagiaire.getPromotion().getId());
			statement.setInt(6, stagiaire.getId());
			return statement;
		}
		catch (SQLException  e) {
			throw new MapperException();
		}
	}
}
