package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import data.model.Answer;
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
		String query = "SELECT * FROM chapter WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		return new Chapter(res.getInt("id"), res.getString("name"), res.getString("parent_path"));
	}

	@Override
	public List<Chapter> getAll() throws SQLException {
		String query = "SELECT * FROM chapter";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet res = st.executeQuery();
		ArrayList<Chapter> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Chapter(res.getInt("id"), res.getString("name"), res.getString("parent_path"))); 
		}
		return liste;
	}

	@Override
	public void update(Chapter data) throws SQLException {
		// TODO Auto-generated method stub
		String query = "UPDATE answer SET name=?, parent_path=? WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, data.getName());
		st.setString(2, data.getParent_path());
		st.setInt(3, data.getId());
		st.executeUpdate();
	}

}
