package com.samsoum.newro.persistence;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.model.Chapter;

public class ChapterDAO {
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	private static ChapterDAO instance;
	
	private String insertQuery = "INSERT INTO chapter(name, parent_path) VALUES(?,?,?);";
	private String deleteQuery = "DELETE FROM chapter WHERE id=?;"; 
	private String getOneQuery = "SELECT * FROM chapter WHERE id=?;";
	private String getAllQuery = "SELECT * FROM chapter;";
	private String getPaginatedQuery = "SELECT * FROM chapter ORDER BY id LIMIT ?, ?;";
	private String updateQuery = "UPDATE chapter SET name=?, parent_path=? WHERE id=?;";
	
	private ChapterDAO() {
		
	}
	public static ChapterDAO getInstance() {
		if (ChapterDAO.instance == null) {
			ChapterDAO.instance = new ChapterDAO();
		}
		return ChapterDAO.instance;
	}
	
	public int add(Chapter data) throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = 	con.prepareStatement(insertQuery);){
			st.setString(1, data.getName());
			st.setString(2, data.getParent_path());
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

	public void delete(int id) throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(deleteQuery);){
			st.setInt(1, id);
			st.executeUpdate();	
		}	
	}

	public Chapter getOne(int id) throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(getOneQuery);){
			st.setInt(1, id);
			ResultSet res = st.executeQuery();
			res.next();
			return new Chapter(res.getInt("id"), res.getString("name"), res.getString("parent_path"));
		}
	}

	public List<Chapter> getAll() throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(getAllQuery);){
			ResultSet res = st.executeQuery();
			ArrayList<Chapter> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(new Chapter(res.getInt("id"), res.getString("name"), res.getString("parent_path"))); 
			}
			return liste;
		}
	}
	
	public List<Chapter> getPaginated() throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(getPaginatedQuery);){
			st.setInt(1, (ChapterDAO.page -1)*ChapterDAO.ROWS_PER_PAGE);
			st.setInt(2, ChapterDAO.ROWS_PER_PAGE);
			ResultSet res = st.executeQuery();
			ArrayList<Chapter> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(new Chapter(res.getInt("id"), res.getString("name"), res.getString("parent_path"))); 
			}
			return liste;
		}
	}

	public void update(Chapter data) throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(updateQuery);){
			st.setString(1, data.getName());
			st.setString(2, data.getParent_path());
			st.setInt(3, data.getId());
			st.executeUpdate();
		}
	}

}
