package com.samsoum.newro.persistence;

public class AnswerDao {
	private String insertQuery = "INSERT INTO answer(label, text,valid_answer, question_id) VALUES(?,?,?,?,?);";
	private String deleteQuery = "DELETE FROM answer WHERE id=?;";
	private String getOneQuery = "SELECT * FROM answer WHERE id=?;";
	private String getAllQuery = "SELECT * FROM answer;";
	private String getPaginatedQuery = "SELECT * FROM answer ORDER BY id LIMIT ?, ?;";
	private String updateQuery = "UPDATE answer SET label=?, text=?, valid_answer=?, question_id=? WHERE id=?;";
	
	private AnswerDao() {
	}
}
