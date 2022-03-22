package com.samsoum.newro.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import org.springframework.stereotype.Component;

import com.samsoum.newro.model.Promotion;

@Component
public class PromotionMapper implements RowMapper<Promotion> {
	private PromotionMapper() {
	}
	
	@Override
	public Promotion mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		return new Promotion(rs.getInt("id"), rs.getString("name"));
	}
}
