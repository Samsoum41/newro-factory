package com.samsoum.newro.mapper;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.samsoum.newro.dto.StagiaireDTOWithId;
import com.samsoum.newro.dto.StagiaireDTOWithoutId;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.service.ServiceException;

@Component
public class StagiaireMapper implements RowMapper<Stagiaire> {
	private PromotionService promotionService;

	
	@Autowired
	private StagiaireMapper(PromotionService promotionService) {
		this.promotionService = promotionService;
	}

	public Stagiaire fromDTO(StagiaireDTOWithoutId stagiaire) throws MapperException {
		// Ici on suppose que le DTO est déjà validé
		String firstName = stagiaire.getFirst_name();
		String lastName = stagiaire.getLast_name();
		LocalDate arrival = LocalDate.parse(stagiaire.getArrival());
		LocalDate formationOver = LocalDate.parse(stagiaire.getFormation_over());
		int promotionId = Integer.parseInt(stagiaire.getPromotion_id());
		Promotion promotion;
		try {
			promotion = promotionService.getOne(promotionId)
					.orElseThrow(() -> new MapperException("Pas de promotion de ce id"));
		} catch (ServiceException e) {
			throw new MapperException();
		}
		return new Stagiaire(firstName, lastName, arrival, formationOver, promotion);
	}

	public Stagiaire fromDTO(StagiaireDTOWithId stagiaire) throws MapperException {
		// Ici on suppose que le DTO est déjà validé et qu'il contient l'ID
		int id = stagiaire.getId();
		String firstName = stagiaire.getFirst_name();
		String lastName = stagiaire.getLast_name();
		LocalDate arrival = LocalDate.parse(stagiaire.getArrival());
		LocalDate formationOver = LocalDate.parse(stagiaire.getFormation_over());
		int promotionId = Integer.parseInt(stagiaire.getPromotion_id());
		Promotion promotion;
		try {
			promotion = promotionService.getOne(promotionId)
					.orElseThrow(() -> new MapperException("Pas de promotion de ce id"));
		} catch (ServiceException e) {
			throw new MapperException();
		}
		return new Stagiaire(id, firstName, lastName, arrival, formationOver, promotion);
	}

	@Override
	public Stagiaire mapRow(ResultSet rs, int rowNum) throws MapperException {
		LocalDate arrival;
		try {
			arrival = rs.getDate("arrival") == null ? null : rs.getDate("arrival").toLocalDate();
			LocalDate formationOver = rs.getDate("formation_over") == null ? null
					: rs.getDate("formation_over").toLocalDate();
			Promotion stagiairePromotion = new Promotion(rs.getInt("promotion_id"), rs.getString("name"));
			return new Stagiaire(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"), arrival,
					formationOver, stagiairePromotion);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new MapperException();
		}
	}

	public PreparedStatement toStatement(Stagiaire stagiaire, PreparedStatement statement) throws MapperException {
		Timestamp arrival = stagiaire.getArrival() == null ? null
				: Timestamp.valueOf(stagiaire.getArrival().atStartOfDay());
		Timestamp formationOver = stagiaire.getFormation_over() == null ? null
				: Timestamp.valueOf(stagiaire.getFormation_over().atStartOfDay());
		try {
			statement.setString(1, stagiaire.getFirst_name());
			statement.setString(2, stagiaire.getLast_name());
			statement.setTimestamp(3, arrival);
			statement.setTimestamp(4, formationOver);
			statement.setInt(5, stagiaire.getPromotion().getId());
			return statement;
		} catch (SQLException e) {
			throw new MapperException();
		}

	}

	public PreparedStatement toUpdateStatement(Stagiaire stagiaire, PreparedStatement statement)
			throws MapperException {
		Date arrival = stagiaire.getArrival() == null ? null : Date.valueOf(stagiaire.getArrival());
		Date formationOver = stagiaire.getFormation_over() == null ? null
				: Date.valueOf(stagiaire.getFormation_over());
		try {
			statement.setString(1, stagiaire.getFirst_name());
			statement.setString(2, stagiaire.getLast_name());
			statement.setDate(3, arrival);
			statement.setDate(4, formationOver);
			statement.setInt(5, stagiaire.getPromotion().getId());
			statement.setInt(6, stagiaire.getId());
			return statement;
		} catch (SQLException e) {
			throw new MapperException();
		}
	}
}
