package data.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import data.DatabaseConnection;
import data.model.Stagiaire;

public class StagiaireDAO implements DAO<Stagiaire>{
	static Connection con = DatabaseConnection.getConnection();

	@Override
	public int add(Stagiaire data) throws SQLException {
		String query = "INSERT INTO stagiaire(id, first_name, last_name, arrival, formation_over, promotion_id) VALUES(?,?,?,?,?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
		st.setInt(1, data.getId());
		st.setString(2, data.getFirst_name());
		st.setString(3, data.getLast_name());
		st.setDate(4, Date.valueOf(data.getArrival()));
		st.setDate(5, Date.valueOf(data.getFormation_over()));
		st.setInt(6, data.getPromotion_id());
		int n = st.executeUpdate();
		return n;
	}

	@Override
	public void delete(int id) throws SQLException {
		String query = "DELETE FROM stagiaire WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();		
	}

	@Override
	public Stagiaire getOne(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Stagiaire> getAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Stagiaire data) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
}
