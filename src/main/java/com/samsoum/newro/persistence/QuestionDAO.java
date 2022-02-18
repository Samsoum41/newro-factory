package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.model.Question;


public class QuestionDAO {
	static Connection con = DatabaseConnection.getConnection();
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;

	public int add(Question data) throws SQLException {
		String query = "INSERT INTO question(title, statement, chapter_id) VALUES(?,?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
		st.setString(1, data.getTitle());
		st.setString(2, data.getStatement());
		st.setInt(3, data.getChapter_id());
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

	public void delete(int id) throws SQLException {
		String query = "DELETE FROM question WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();		
	}

	public Question getOne(int id) throws SQLException {
		String query = "SELECT * FROM question WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		res.next();
		return new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"));
	}

	public List<Question> getAll() throws SQLException {
		String query = "SELECT * FROM question";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet res = st.executeQuery();
		ArrayList<Question> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"))); 
		}
		return liste;
	}
	
	public List<Question> getPaginated() throws SQLException{
		String query = "SELECT * FROM question ORDER BY id LIMIT ?, ?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, (QuestionDAO.page -1)*QuestionDAO.ROWS_PER_PAGE);
		st.setInt(2, QuestionDAO.ROWS_PER_PAGE);
		ResultSet res = st.executeQuery();
		ArrayList<Question> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"))); 
		}
		return liste;
	}

	public void update(Question data) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
