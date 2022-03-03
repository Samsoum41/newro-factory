package com.samsoum.newro.mapper;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;

import com.samsoum.newro.dto.StagiaireDTOWithId;
import com.samsoum.newro.dto.StagiaireDTOWithoutId;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.ServiceException;

public class StagiaireMapper {
	private static StagiaireMapper instance;

	private StagiaireMapper() {

	}

	public static StagiaireMapper getInstance() {
		if (instance == null) {
			instance = new StagiaireMapper();
		}
		return instance;
	}

	public Stagiaire fromDTO(StagiaireDTOWithoutId stagiaire) throws MapperException {
		// Ici on suppose que le DTO est déjà validé
		String first_name = stagiaire.getFirst_name();
		String last_name = stagiaire.getLast_name();
		LocalDate arrival = LocalDate.parse(stagiaire.getArrival());
		LocalDate formation_over = LocalDate.parse(stagiaire.getFormation_over());
		int promotion_id = Integer.parseInt(stagiaire.getPromotion_id());
		Promotion promotion;
		try {
			promotion = PromotionService.getInstance().getOne(promotion_id)
					.orElseThrow(() -> new MapperException("Pas de promotion de ce id"));
		} catch (ServiceException e) {
			throw new MapperException();
		}
		return new Stagiaire(first_name, last_name, arrival, formation_over, promotion);
	}

	public Stagiaire fromDTO(StagiaireDTOWithId stagiaire) throws MapperException {
		// Ici on suppose que le DTO est déjà validé et qu'il contient l'ID
		int id = stagiaire.getId();
		String first_name = stagiaire.getFirst_name();
		String last_name = stagiaire.getLast_name();
		LocalDate arrival = LocalDate.parse(stagiaire.getArrival());
		LocalDate formation_over = LocalDate.parse(stagiaire.getFormation_over());
		int promotion_id = Integer.parseInt(stagiaire.getPromotion_id());
		Promotion promotion;
		try {
			promotion = PromotionService.getInstance().getOne(promotion_id)
					.orElseThrow(() -> new MapperException("Pas de promotion de ce id"));
		} catch (ServiceException e) {
			throw new MapperException();
		}
		return new Stagiaire(id, first_name, last_name, arrival, formation_over, promotion);
	}

	public Stagiaire toModel(ResultSet res) throws MapperException {
		// TODO : Remplacer les instructions ternaires par des Optionals
		try {
			LocalDate arrival = res.getDate("arrival") == null ? null : res.getDate("arrival").toLocalDate();
			LocalDate formation_over = res.getDate("formation_over") == null ? null
					: res.getDate("formation_over").toLocalDate();
			Promotion stagiairePromotion = new Promotion(res.getInt("promotion_id"), res.getString("name"));
			return new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival,
					formation_over, stagiairePromotion);
		} catch (SQLException e) {
			throw new MapperException();
		}
	}

	public PreparedStatement toStatement(Stagiaire stagiaire, PreparedStatement statement) throws MapperException {
		Timestamp arrival = stagiaire.getArrival() == null ? null
				: Timestamp.valueOf(stagiaire.getArrival().atStartOfDay());
		Timestamp formation_over = stagiaire.getFormation_over() == null ? null
				: Timestamp.valueOf(stagiaire.getFormation_over().atStartOfDay());
		try {
			statement.setString(1, stagiaire.getFirst_name());
			statement.setString(2, stagiaire.getLast_name());
			statement.setTimestamp(3, arrival);
			statement.setTimestamp(4, formation_over);
			statement.setInt(5, stagiaire.getPromotion().getId());
			return statement;
		} catch (SQLException e) {
			throw new MapperException();
		}

	}

	public PreparedStatement toUpdateStatement(Stagiaire stagiaire, PreparedStatement statement)
			throws MapperException {
		Date arrival = stagiaire.getArrival() == null ? null : Date.valueOf(stagiaire.getArrival());
		Date formation_over = stagiaire.getFormation_over() == null ? null
				: Date.valueOf(stagiaire.getFormation_over());
		try {
			statement.setString(1, stagiaire.getFirst_name());
			statement.setString(2, stagiaire.getLast_name());
			statement.setDate(3, arrival);
			statement.setDate(4, formation_over);
			statement.setInt(5, stagiaire.getPromotion().getId());
			statement.setInt(6, stagiaire.getId());
			return statement;
		} catch (SQLException e) {
			throw new MapperException();
		}
	}
}
