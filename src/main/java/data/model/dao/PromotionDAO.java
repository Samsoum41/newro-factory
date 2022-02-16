package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import data.model.Promotion;

public class PromotionDAO implements DAO<Promotion>{
	static Connection con = DatabaseConnection.getConnection();
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	@Override
	public int add(Promotion data) throws SQLException {
		String query = "INSERT INTO promotion(name) VALUES(?);";
		PreparedStatement st = 	con.prepareStatement(query);
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

	@Override
	public void delete(int id) throws SQLException {
		String query = "DELETE FROM promotion WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();		
	}

	@Override
	public Promotion getOne(int id) throws SQLException {
		String query = "SELECT * FROM promotion WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		if(res.next()) {
			return new Promotion(res.getInt("id"), res.getString("name"));
		}
		else {
			throw new SQLException("Il n'y a aucune promotion associée à cet id");
		}
	}

	@Override
	public List<Promotion> getAll() throws SQLException {
		String query = "SELECT * FROM promotion";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet res = st.executeQuery();
		ArrayList<Promotion> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Promotion(res.getInt("id"), res.getString("name"))); 
		}
		return liste;
	}
	
	@Override
	public List<Promotion> getPaginated() throws SQLException{
		String query = "SELECT * FROM promotion ORDER BY id LIMIT ?, ?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, (PromotionDAO.page -1)*PromotionDAO.ROWS_PER_PAGE);
		st.setInt(2, PromotionDAO.ROWS_PER_PAGE);
		ResultSet res = st.executeQuery();
		ArrayList<Promotion> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Promotion(res.getInt("id"), res.getString("name"))); 
		}
		return liste;
	}

	@Override
	public void update(Promotion data) throws SQLException {
		String query = "UPDATE promotion SET name=? WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, data.getName());
		st.setInt(2, data.getId());
		st.executeUpdate();
	}

}
