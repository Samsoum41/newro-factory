package com.samsoum.newro.persistence;

public class QuestionDAO {
	public static int page = 1;
	private final static int ROWS_PER_PAGE = 10;
	private String insertQuery = "INSERT INTO question(title, statement, chapter_id) VALUES(?,?,?);";
	private String deleteQuery = "DELETE FROM question WHERE id=?;"; 
	private String DELETE_UNDERLYING_ANSWERS = "DELETE FROM answer WHERE question_id=?;";
	private String getOneQuery = "SELECT * FROM question WHERE id=?;";
	private String getAllQuery = "SELECT * FROM question;";
	private String getPaginated = "SELECT * FROM question ORDER BY id LIMIT ?, ?;";

	private QuestionDAO() {
	}
}
