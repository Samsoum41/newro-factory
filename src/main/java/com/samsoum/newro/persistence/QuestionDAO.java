package com.samsoum.newro.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.samsoum.newro.model.Question;


public class QuestionDAO {
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	private static QuestionDAO instance;
	private String insertQuery = "INSERT INTO question(title, statement, chapter_id) VALUES(?,?,?);";
	private String deleteQuery = "DELETE FROM question WHERE id=?;"; 
	private String DELETE_UNDERLYING_ANSWERS = "DELETE FROM answer WHERE question_id=?;";
	private String getOneQuery = "SELECT * FROM question WHERE id=?;";
	private String getAllQuery = "SELECT * FROM question;";
	private String getPaginated = "SELECT * FROM question ORDER BY id LIMIT ?, ?;";

	private QuestionDAO() {
		
	}
	public static QuestionDAO getInstance() {
		if (QuestionDAO.instance == null) {
			QuestionDAO.instance = new QuestionDAO();
		}
		return QuestionDAO.instance;
	}
	
	public int add(Question data) throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = 	con.prepareStatement(insertQuery);){
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
	}

	public int delete(int id) throws DAOException {
		try (Connection con = DataSource.getInstance().getConnection();) {
			// Ca c'est important pour ne pas exécuter de commandes partielles
			con.setAutoCommit(false);
			PreparedStatement deleteQuestionStatement = con.prepareStatement(deleteQuery);
			PreparedStatement deleteAnswersStatement = con.prepareStatement(DELETE_UNDERLYING_ANSWERS);
			deleteQuestionStatement.setInt(1, id);
			deleteAnswersStatement.setInt(1, id);
			try {
				int answerRes = deleteAnswersStatement.executeUpdate();
				if (answerRes > 0) {
					System.out.println("Les réponses de la questinon d'id " + id + " a bien été supprimé");
				} else {
					System.out.println("Pas de réponse avec cet id");
					throw new DAOException();
				}
				int questionRes = deleteQuestionStatement.executeUpdate();
				if (questionRes > 0) {
					System.out.println("La question d'id " + id + " a bien été supprimé");
				} else {
					System.out.println("Pas de question avec cet id");
					throw new DAOException();
				}
				con.commit();
				return questionRes;
			} catch (SQLException e) {
				con.rollback();
				e.printStackTrace();
				throw new DAOException(
						"Problème dans la suppression de la question d'identifiant : " + id + " en base de donnée.");
			}
		} catch (SQLException e) {
			// TODO : Logger
			e.printStackTrace();
			throw new DAOException("Problème dans la connexion à la base de donnée");
		}
	}

	public Question getOne(int id) throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(getOneQuery);){
			st.setInt(1, id);
			ResultSet res = st.executeQuery();
			res.next();
			return new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"));
		}
	}

	public List<Question> getAll() throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(getAllQuery);){
			ResultSet res = st.executeQuery();
			ArrayList<Question> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"))); 
			}
			return liste;
		}
	}
	
	public List<Question> getPaginated() throws SQLException, DAOException {
		try(Connection con = DataSource.getInstance().getConnection(); 
			PreparedStatement st = con.prepareStatement(getPaginated);){
			st.setInt(1, (QuestionDAO.page -1)*QuestionDAO.ROWS_PER_PAGE);
			st.setInt(2, QuestionDAO.ROWS_PER_PAGE);
			ResultSet res = st.executeQuery();
			ArrayList<Question> liste = new ArrayList<>();
			while(res.next()) {
				liste.add(new Question(res.getInt("id"), res.getString("title"), res.getString("statement"), res.getInt("chapter_id"))); 
			}
			return liste;
		}
	}

	public void update(Question data) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
