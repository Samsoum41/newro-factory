package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import data.model.Chapter;
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
		String query = "SELECT * FROM Question WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		return new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"));
	}
	@Override
	public List<Question> getAll() throws SQLException {
		String query = "SELECT * FROM Question";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet res = st.executeQuery();
		ArrayList<Question> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"))); 
		}
		return liste;
	}

	@Override
	public void update(Question data) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
