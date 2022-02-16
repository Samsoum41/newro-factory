package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import data.model.Chapter;

public class ChapterDAO implements DAO<Chapter> {
	static Connection con = DatabaseConnection.getConnection();
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	
	@Override
	public int add(Chapter data) throws SQLException {
		String query = "INSERT INTO chapter(name, parent_path) VALUES(?,?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
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
		res.next();
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
	public List<Chapter> getPaginated() throws SQLException{
		String query = "SELECT * FROM chapter ORDER BY id LIMIT ?, ?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, (ChapterDAO.page -1)*ChapterDAO.ROWS_PER_PAGE);
		st.setInt(2, ChapterDAO.ROWS_PER_PAGE);
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
