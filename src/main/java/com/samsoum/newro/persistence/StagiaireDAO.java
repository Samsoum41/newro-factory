package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.model.Stagiaire;


public class StagiaireDAO {
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 40;
	private static StagiaireDAO instance;
	private String insertQuery = "INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id) VALUES(?,?,?,?,?);";
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
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = 	con.prepareStatement(insertQuery);){
			Timestamp arrival = data.getArrival() == null  ? null : Timestamp.valueOf(data.getArrival().atStartOfDay());
			Timestamp formation_over = data.getFormation_over() == null ? null : Timestamp.valueOf(data.getFormation_over().atStartOfDay());
			
			st.setString(1, data.getFirst_name());
			st.setString(2, data.getLast_name());
			st.setTimestamp(3, arrival);
			st.setTimestamp(4, formation_over);
			st.setInt(5, data.getPromotion_id());
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
		try(Connection con = DatabaseConnection.getConnection(); 
		PreparedStatement st = con.prepareStatement(deleteQuery);){
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
			LocalDate arrival = res.getDate("arrival") == null  ? null : res.getDate("arrival").toLocalDate();
			LocalDate formation_over = res.getDate("formation_over") == null ? null : res.getDate("arrival").toLocalDate();
			return new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival, formation_over, res.getInt("promotion_id"));
		} 
	}

	public List<Stagiaire> getAll() throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(getAllQuery);) {
			ResultSet res = st.executeQuery();
			ArrayList<Stagiaire> liste = new ArrayList<>();
			while(res.next()) {
				LocalDate arrival = res.getDate("arrival") == null  ? null : res.getDate("arrival").toLocalDate();
				LocalDate formation_over = res.getDate("formation_over") == null ? null : res.getDate("arrival").toLocalDate();
				liste.add(new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival, formation_over, res.getInt("promotion_id"))); 
			}
			return liste;
		}
	}
	
	public List<Stagiaire> getPaginated() throws SQLException{
		return this.getPaginated(StagiaireDAO.page);
	}
	
	public List<Stagiaire> getPaginated( int page) throws SQLException{
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(getPaginatedQuery);){
			st.setInt(1, (page -1)*StagiaireDAO.ROWS_PER_PAGE);
			st.setInt(2, StagiaireDAO.ROWS_PER_PAGE);
			ResultSet res = st.executeQuery();
			ArrayList<Stagiaire> liste = new ArrayList<>();
			while(res.next()) {
				LocalDate arrival = res.getDate("arrival") == null  ? null : res.getDate("arrival").toLocalDate();
				LocalDate formation_over = res.getDate("formation_over") == null ? null : res.getDate("arrival").toLocalDate();
				liste.add(new Stagiaire(res.getInt("id"), res.getString("first_name"), res.getString("last_name"), arrival, formation_over, res.getInt("promotion_id"))); 
			}
			return liste;
		}
	}
	
	public boolean hasNextPage() throws SQLException {
		return !getPaginated(page +1).isEmpty();
	}

	public void update(Stagiaire data) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(updateQuery);){
			Date arrival = data.getArrival() == null ? null : Date.valueOf(data.getArrival());
			Date formation_over = data.getFormation_over() == null ? null : Date.valueOf(data.getFormation_over());

			st.setString(1, data.getFirst_name());
			st.setString(2, data.getLast_name());
			st.setDate(3, arrival);
			st.setDate(4, formation_over);
			st.setInt(5, data.getPromotion_id());
			st.setInt(6, data.getId());

			try {
				st.executeUpdate();
				System.out.println("Le stagiaire : " + data + " a bien été modifié !");
			}
			catch(SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
}
