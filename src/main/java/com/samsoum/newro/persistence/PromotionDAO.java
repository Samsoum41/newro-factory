package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.model.Promotion;

public class PromotionDAO{
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	private static PromotionDAO instance;
	private String insertQuery = "INSERT INTO promotion(name) VALUES(?);";
	private String deleteQuery = "DELETE FROM promotion WHERE id=?;"; 
	private String getOneQuery = "DELETE FROM promotion WHERE id=?;"; 
	private String getAllQuery = "SELECT * FROM promotion;";
	private String getPaginatedQuery = "SELECT * FROM promotion ORDER BY id LIMIT ?, ?;";
	private String updateQuery = "UPDATE promotion SET name=? WHERE id=?;";
	
	private PromotionDAO() {
		
	}
	public static PromotionDAO getInstance() {
		if (PromotionDAO.instance == null) {
			PromotionDAO.instance = new PromotionDAO();
		}
		return PromotionDAO.instance;
	}
	public int add(Promotion data) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = 	con.prepareStatement(insertQuery);){
			st.setString(1, data.getName());
			try {
				int n = st.executeUpdate();
				System.out.println("L'enregistrement : " + data + " a bien été enregistré");
				return n;
			}
			catch(SQLException e) {
				System.out.println("L'enregistrement en base de donné a échoué");
				System.out.println(e.getMessage());
				return 0;
			}
		}
	}

	public void delete(int id) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(deleteQuery);){
			st.setInt(1, id);
			st.executeUpdate();	
		}	
	}

	public Promotion getOne(int id) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(getOneQuery);){
			st.setInt(1, id);
			ResultSet res = st.executeQuery();
			if(res.next()) {
				return new Promotion(res.getInt("id"), res.getString("name"));
			}
			else {
				throw new SQLException("Il n'y a aucune promotion associée à cet id");
			}
		}
	}

	public List<Promotion> getAll() throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(getAllQuery);){
			ResultSet res = st.executeQuery();
			ArrayList<Promotion> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(new Promotion(res.getInt("id"), res.getString("name"))); 
			}
			return liste;
		}
	}
	
	public List<Promotion> getPaginated() throws SQLException{
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(getPaginatedQuery);){
			st.setInt(1, (PromotionDAO.page -1)*PromotionDAO.ROWS_PER_PAGE);
			st.setInt(2, PromotionDAO.ROWS_PER_PAGE);
			ResultSet res = st.executeQuery();
			ArrayList<Promotion> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(new Promotion(res.getInt("id"), res.getString("name"))); 
			}
			return liste;
		}
	}

	public void update(Promotion data) throws SQLException {
		try(Connection con = DatabaseConnection.getConnection(); 
			PreparedStatement st = con.prepareStatement(updateQuery);){
			st.setString(1, data.getName());
			st.setInt(2, data.getId());
			st.executeUpdate();
		}
	}

}
