package data.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.DatabaseConnection;
import data.model.Answer;

public class AnswerDAO implements DAO<Answer> {
	static Connection con = DatabaseConnection.getConnection();
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	
	@Override
	public int add(Answer data) throws SQLException {
		// TODO Auto-generated method stub
		String query = "INSERT INTO answer(label, text,valid_answer, question_id) VALUES(?,?,?,?,?);";
		PreparedStatement st = 	con.prepareStatement(query);
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

	@Override
	public void delete(int id) throws SQLException {
		// TODO Auto-generated method stub
		String query = "DELETE FROM answer WHERE id=?;"; 
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		st.executeUpdate();
	}

	@Override
	public Answer getOne(int id) throws SQLException {
		// TODO Auto-generated method stub
		String query = "SELECT * FROM answer WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet res = st.executeQuery();
		res.next();
		return new Answer(res.getInt("id"), res.getString("label"), res.getString("text"), res.getShort("valid_answer"), res.getInt("question_id"));
	}

	@Override
	public List<Answer> getAll() throws SQLException {
		// TODO Auto-generated method stub
		String query = "SELECT * FROM answer";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet res = st.executeQuery();
		ArrayList<Answer> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Answer(res.getInt("id"), res.getString("label"), res.getString("text"), res.getShort("valid_answer"), res.getInt("question_id"))); 
		}
		return liste;
	}
	
	@Override
	public List<Answer> getPaginated() throws SQLException{
		String query = "SELECT * FROM answer ORDER BY id LIMIT ?, ?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, (AnswerDAO.page -1)*AnswerDAO.ROWS_PER_PAGE);
		st.setInt(2, AnswerDAO.ROWS_PER_PAGE);
		ResultSet res = st.executeQuery();
		ArrayList<Answer> liste = new ArrayList<>();
		while(res.next()) {
			liste.add(new Answer(res.getInt("id"), res.getString("label"), res.getString("text"), res.getShort("valid_answer"), res.getInt("question_id"))); 
		}
		return liste;
	}
	
	@Override
	public void update(Answer data) throws SQLException {
		// TODO Auto-generated method stub
		String query = "UPDATE answer SET label=?, text=?, valid_answer=?, question_id=? WHERE id=?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, data.getLabel());
		st.setString(2, data.getText());
		st.setInt(3, data.getValid_answer());
		st.setInt(4, data.getQuestion_id());
		st.setInt(5, data.getId());
		st.executeUpdate();
	}
}
