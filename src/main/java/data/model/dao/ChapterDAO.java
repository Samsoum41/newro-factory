package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import data.DatabaseConnection;
import data.model.Chapter;

public class ChapterDAO implements DAO<Chapter> {
	static Connection con = DatabaseConnection.getConnection();
	
	@Override
	public int add(Chapter data) throws SQLException {
		String query = "INSERT INTO chapter(id, name, parent_path) VALUES(?,?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
		st.setInt(1, data.getId());
		st.setString(2, data.getName());
		st.setString(3, data.getParent_path());
		int n = st.executeUpdate();
		return n;
	}

	@Override
	public void delete(int id) throws SQLException {
		String query = "DELETE FROM chapter WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();		
	}

	@Override
	public Chapter getOne(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Chapter> getAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Chapter data) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
