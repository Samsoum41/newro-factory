package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Stagiaire;


public class StagiaireDAO {
	public static int page = 1;
	private static int rowsPerPage = 40;
	private static StagiaireDAO instance;
	private String insertQuery = "INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id) VALUES(?,?,?,?,?);";
	private String countQuery = "SELECT COUNT(*) AS rowcount FROM stagiaire;";
	private String deleteQuery = "DELETE FROM stagiaire WHERE id=?;"; 
	private String getOneQuery = "SELECT * FROM stagiaire WHERE id=?;";
	private String getAllQuery = "SELECT * FROM stagiaire;";
	private String getPaginatedQuery = "SELECT * FROM stagiaire ORDER BY id LIMIT ?, ?;";
	private String updateQuery = "UPDATE stagiaire SET first_name=?, last_name=?, arrival=?, formation_over=?, promotion_id=? WHERE id=?;";

	private StagiaireDAO() {
		
	}
	public static StagiaireDAO getInstance() {
		if (StagiaireDAO.instance == null) {
			StagiaireDAO.instance = new StagiaireDAO();
		}
		return StagiaireDAO.instance;
	}
	
	public void add(Stagiaire data) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); ){
			PreparedStatement st = 	con.prepareStatement(insertQuery);
			st = StagiaireMapper.getInstance().toStatement(data, st);
			try {
				st.executeUpdate();
				System.out.println("L'enregistrement : " + data + " a bien été enregistré");
			}
			catch(SQLException e) {
				System.out.println("L'enregistrement en base de donné a échoué");
				System.out.println(e.getMessage());
			} 
		}
	}


	public void delete(int id) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); ){
			PreparedStatement st = con.prepareStatement(deleteQuery);
			st.setInt(1, id);
			st.executeUpdate();		
			System.out.println("Le stagiaire d'id " + id + " a bien été supprimé"); 
		}	
	}

	public Stagiaire getOne(int id) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(getOneQuery);){
			st.setInt(1, id);
			ResultSet res = st.executeQuery();
			res.next();
			return StagiaireMapper.getInstance().toModel(res);
		} 
	}

	public int getNumberOfStagiaires() throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); ) {
				PreparedStatement st = con.prepareStatement(countQuery);
				ResultSet res = st.executeQuery();
				res.next();
				int numOfRows = res.getInt("rowcount");
				// We need to add one page to store the last rows
				int numOfPages = (numOfRows/StagiaireDAO.rowsPerPage)+1;
				return numOfPages;
		}
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public List<Stagiaire> getAll() throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); ) {
			PreparedStatement st = con.prepareStatement(getAllQuery);
			ResultSet res = st.executeQuery();
			ArrayList<Stagiaire> liste = new ArrayList<>();
			while(res.next()) {
				
				liste.add(StagiaireMapper.getInstance().toModel(res)); 
			}
			return liste;
		}
	}
	
	public List<Stagiaire> getPaginated() throws SQLException{
		return this.getPaginated(StagiaireDAO.page);
	}
	
	public List<Stagiaire> getPaginated( int page) throws SQLException{
		try(Connection con = DatabaseConnection.getConnection(); ){
			PreparedStatement st = con.prepareStatement(getPaginatedQuery);
			st.setInt(1, (page -1)*StagiaireDAO.rowsPerPage);
			st.setInt(2, StagiaireDAO.rowsPerPage);
			System.out.println(rowsPerPage);
			ResultSet res = st.executeQuery();
			ArrayList<Stagiaire> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(StagiaireMapper.getInstance().toModel(res)); 
			}
			return liste;
		}
	}
	
	public boolean hasNextPage() throws SQLException {
		return !getPaginated(page +1).isEmpty();
	}

	public void update(Stagiaire stagiaire) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection();){
			PreparedStatement statement = con.prepareStatement(updateQuery);
			Date arrival = stagiaire.getArrival() == null ? null : Date.valueOf(stagiaire.getArrival());
			Date formation_over = stagiaire.getFormation_over() == null ? null : Date.valueOf(stagiaire.getFormation_over());

			statement.setString(1, stagiaire.getFirst_name());
			statement.setString(2, stagiaire.getLast_name());
			statement.setDate(3, arrival);
			statement.setDate(4, formation_over);
			statement.setInt(5, stagiaire.getPromotion().getId());
			statement.setInt(6, stagiaire.getId());
			try {
				statement.executeUpdate();
				System.out.println("Le stagiaire : " + stagiaire + " a bien été modifié !");
			}
			catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	public void setRowsPerPage(int numOfRows) {
		rowsPerPage = numOfRows;
	}
	
}
