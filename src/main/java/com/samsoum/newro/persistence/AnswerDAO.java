package com.samsoum.newro.persistence;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.model.Answer;


public class AnswerDAO {
	static Connection con = DatabaseConnection.getConnection();
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	private static AnswerDAO instance;
	
	
	private String insertQuery = "INSERT INTO answer(label, text,valid_answer, question_id) VALUES(?,?,?,?,?);";
	private String deleteQuery = "DELETE FROM answer WHERE id=?;"; 
	private String getOneQuery = "SELECT * FROM answer WHERE id=?;";
	private String getAllQuery = "SELECT * FROM answer;";
	private String getPaginatedQuery = "SELECT * FROM answer ORDER BY id LIMIT ?, ?;";
	private String updateQuery = "UPDATE answer SET label=?, text=?, valid_answer=?, question_id=? WHERE id=?;";
	
	private AnswerDAO() {
		
	}
	
	public static AnswerDAO getInstance() {
		if (AnswerDAO.instance == null) {
			AnswerDAO.instance = new AnswerDAO();
		}
		return AnswerDAO.instance;
	}
	
	public int add(Answer data) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement st = 	con.prepareStatement(insertQuery);
		st.setString(1, data.getLabel());
		st.setString(2, data.getText());
		st.setInt(3, data.getValid_answer());
		st.setInt(4, data.getQuestion_id());
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
		PreparedStatement st = con.prepareStatement(deleteQuery);
		st.setInt(1, id);
		st.executeUpdate();
	}

	public Answer getOne(int id) throws SQLException {
		PreparedStatement st = con.prepareStatement(getOneQuery);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		res.next();
		return new Answer(res.getInt("id"), res.getString("label"), res.getString("text"), res.getShort("valid_answer"), res.getInt("question_id"));
	}

	public List<Answer> getAll() throws SQLException {
		PreparedStatement st = con.prepareStatement(getAllQuery);
		ResultSet res = st.executeQuery();
		ArrayList<Answer> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Answer(res.getInt("id"), res.getString("label"), res.getString("text"), res.getShort("valid_answer"), res.getInt("question_id"))); 
		}
		return liste;
	}
	
	public List<Answer> getPaginated() throws SQLException{
		PreparedStatement st = con.prepareStatement(getPaginatedQuery);
		st.setInt(1, (AnswerDAO.page -1)*AnswerDAO.ROWS_PER_PAGE);
		st.setInt(2, AnswerDAO.ROWS_PER_PAGE);
		ResultSet res = st.executeQuery();
		ArrayList<Answer> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Answer(res.getInt("id"), res.getString("label"), res.getString("text"), res.getShort("valid_answer"), res.getInt("question_id"))); 
		}
		return liste;
	}
	
	public void update(Answer data) throws SQLException {
		PreparedStatement st = con.prepareStatement(updateQuery);
		st.setString(1, data.getLabel());
		st.setString(2, data.getText());
		st.setInt(3, data.getValid_answer());
		st.setInt(4, data.getQuestion_id());
		st.setInt(5, data.getId());
		st.executeUpdate();
	}
}
