package com.samsoum.newro.persistence;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.ui.PageStagiaire;

@Repository
public class StagiaireDAO {
	private StagiaireMapper mapper;
	// Parfois je ne mets pas le ';' dans les requêtes pour pouvoir les concaténer
	private String SELECT_QUERY = "SELECT stagiaire.id, first_name, last_name, arrival, formation_over, promotion_id, name FROM stagiaire INNER JOIN promotion ON promotion_id=promotion.id ";
	private String ORDER_QUERY = "ORDER BY %s ASC ";	
	private String PAGINATE_QUERY = "LIMIT :limit, :offset ";
	private String FILTER_QUERY = "WHERE %s LIKE '%%%s%%' ";
	// Requêtes composés : 
	private String INSERT_QUERY = "INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id) VALUES(:first_name, :last_name, :arrival, :formation_over, :promotion_id);";
	private String COUNT_QUERY = "SELECT COUNT(*) AS rowcount FROM stagiaire;";
	private String DELETE_QUERY = "DELETE FROM stagiaire WHERE stagiaire.id=:id;";
	private String UPDATE_QUERY = "UPDATE stagiaire SET first_name=:first_name, last_name=:last_name, arrival=:arrival, formation_over=:formation_over, promotion_id=:promotion_id WHERE stagiaire.id=:id;";
	private String GET_ONE_QUERY = SELECT_QUERY + "WHERE stagiaire.id=:id;";
	private String GET_BY_NAMES_QUERY = SELECT_QUERY + "WHERE first_name = :first_name AND last_name= :last_name;";
	private String GET_ORDERED_PAGINATED_AND_FILTERED_QUERY = SELECT_QUERY + FILTER_QUERY + ORDER_QUERY + PAGINATE_QUERY;
	
	private NamedParameterJdbcTemplate namedJdbcTemplate;
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public StagiaireDAO(StagiaireMapper mapper,NamedParameterJdbcTemplate namedJdbcTemplate, JdbcTemplate jdbcTemplate) {
		this.mapper = mapper;
		this.namedJdbcTemplate = namedJdbcTemplate;
		this.jdbcTemplate = jdbcTemplate;
	}

	public Optional<Stagiaire> getByNames(String first_name, String last_name) {
		SqlParameterSource parameters = new MapSqlParameterSource().addValue("first_name", first_name).addValue("last_name", last_name);
		Stagiaire stagiaire = namedJdbcTemplate.queryForObject(GET_BY_NAMES_QUERY, parameters, mapper);
		if (stagiaire == null) {
			return Optional.empty();
		}
		else {
			return Optional.of(stagiaire);
		}
	}

	public void add(Stagiaire stagiaire) {
		SqlParameterSource parameters = new BeanPropertySqlParameterSource(stagiaire);
		namedJdbcTemplate.update(INSERT_QUERY, parameters);
	}

	public int delete(int id) {
		SqlParameterSource parameters = new MapSqlParameterSource().addValue("id", id);
		return namedJdbcTemplate.update(DELETE_QUERY, parameters);
	}

	public Optional<Stagiaire> getById(int id) {
		SqlParameterSource parameters = new MapSqlParameterSource().addValue("id", id);
		Stagiaire stagiaire = namedJdbcTemplate.queryForObject(GET_ONE_QUERY, parameters, mapper);
		if (stagiaire == null) {
			return Optional.empty();
		}
		else {
			return Optional.of(stagiaire);
		}	
	}

	public int count() {
		return jdbcTemplate.queryForObject(COUNT_QUERY, Integer.class);
	}

	public PageStagiaire get(int page, int rowsPerPage) {
		return get(StagiaireField.FIRST_NAME, StagiaireField.FIRST_NAME, "", page, rowsPerPage);
	}
	/**
	 *  Par défaut on renvoie une liste trié par id
	 * @param orderField
	 * @param filterValue
	 * @param page
	 * @param rowsPerPage
	 * @return
	 * @throws DAOException
	 */
	public PageStagiaire get(StagiaireField orderField, int page, int rowsPerPage) {
		return get(orderField, StagiaireField.FIRST_NAME, "", page, rowsPerPage);
	}
	
	public PageStagiaire get(StagiaireField orderField, StagiaireField filterField, String filterValue, int page, int rowsPerPage) {
		int nbStagiaires = count();
		int premierId = (page - 1) * rowsPerPage;
		String query = String.format(GET_ORDERED_PAGINATED_AND_FILTERED_QUERY, filterField.getValue(), filterValue, orderField.getValue());
		SqlParameterSource parameters  = new MapSqlParameterSource().addValue("limit", premierId).addValue("offset", rowsPerPage);
		ArrayList<Stagiaire> stagiaires = (ArrayList<Stagiaire>) namedJdbcTemplate.query(query, parameters, mapper);
		return new PageStagiaire(page, rowsPerPage, stagiaires, nbStagiaires); 
	}

	public int update(Stagiaire stagiaire) {
		SqlParameterSource parameters = new BeanPropertySqlParameterSource(stagiaire);
		return namedJdbcTemplate.update(UPDATE_QUERY, parameters);
	}
}
