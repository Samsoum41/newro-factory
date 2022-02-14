package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import data.DatabaseConnection;
import data.model.Question;

public class QuestionDAO implements DAO<Question>{
	static Connection con = DatabaseConnection.getConnection();

	@Override
	public int add(Question data) throws SQLException {
		String query = "INSERT INTO chapter(id, title, statement, chapter_id) VALUES(?,?,?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
		st.setInt(1, data.getId());
		st.setString(2, data.getTitle());
		st.setString(3, data.getStatement());
		st.setInt(4, data.getChapter_id());
		int n = st.executeUpdate();
		return n;
	}

	@Override
	public void delete(int id) throws SQLException {
		String query = "DELETE FROM question WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();		
	}

	@Override
	public Question getOne(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Question> getAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Question data) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
