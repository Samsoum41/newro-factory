package com.samsoum.newro.persistence;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.samsoum.newro.mapper.PromotionMapper;
import com.samsoum.newro.model.Promotion;

@Repository
public class PromotionDao {
	private PromotionMapper mapper;
	private NamedParameterJdbcTemplate namedJdbcTemplate;
	private JdbcTemplate jdbcTemplate;
	
	// Queries
	private String INSERT_QUERY = "INSERT INTO promotion(name) VALUES(:name);";
	private String DELETE_QUERY = "DELETE FROM promotion WHERE id=:id;"; 
	private String GET_BY_ID_QUERY = "SELECT id, name FROM promotion WHERE id=:id;"; 
	private String GET_ALL_QUERY = "SELECT id, name FROM promotion;"; 
	private String UPDATE_QUERY = "UPDATE promotion SET name=? WHERE id=:id;";
	
	@Autowired
	private PromotionDao(PromotionMapper mapper, NamedParameterJdbcTemplate namedJdbcTemplate, JdbcTemplate jdbcTemplate) {
		 this.mapper = mapper;
		 this.namedJdbcTemplate = namedJdbcTemplate;
		 this.jdbcTemplate = jdbcTemplate;
	}

	public void add(Promotion promotion) {
		SqlParameterSource parameters = new BeanPropertySqlParameterSource(promotion);
		namedJdbcTemplate.update(INSERT_QUERY, parameters);
	}

	public int delete(int id) {
		SqlParameterSource parameters = new MapSqlParameterSource().addValue("id", id);
		return namedJdbcTemplate.update(DELETE_QUERY, parameters);
	}

	public Optional<Promotion> getById(int id) {
		SqlParameterSource parameters = new MapSqlParameterSource().addValue("id", id);
		Promotion promotion = namedJdbcTemplate.queryForObject(GET_BY_ID_QUERY, parameters, mapper);
		if (promotion == null) {
			return Optional.empty();
		} else {
			return Optional.of(promotion);
		}	
	}
	
	public List<Promotion> getAll() {
		return jdbcTemplate.query(GET_ALL_QUERY, mapper);
	}

	public int update(Promotion promotion) {
		SqlParameterSource parameters = new BeanPropertySqlParameterSource(promotion);
		return namedJdbcTemplate.update(UPDATE_QUERY, parameters);
	}

}
