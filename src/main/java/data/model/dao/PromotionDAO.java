package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import data.DatabaseConnection;
import data.model.Promotion;

public class PromotionDAO implements DAO<Promotion>{
	static Connection con = DatabaseConnection.getConnection();

	@Override
	public int add(Promotion data) throws SQLException {
		String query = "INSERT INTO promotion(id, name) VALUES(?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
		st.setInt(1, data.getId());
		st.setString(2, data.getName());
		int n = st.executeUpdate();
		return n;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Promotion> getAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Promotion data) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
