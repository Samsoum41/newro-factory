package com.samsoum.newro.persistence;

public class ChapterDao {
	private String insertQuery = "INSERT INTO chapter(name, parent_path) VALUES(?,?,?);";
	private String deleteQuery = "DELETE FROM chapter WHERE id=?;"; 
	private String getOneQuery = "SELECT * FROM chapter WHERE id=?;";
	private String getAllQuery = "SELECT * FROM chapter;";
	private String getPaginatedQuery = "SELECT * FROM chapter ORDER BY id LIMIT ?, ?;";
	private String updateQuery = "UPDATE chapter SET name=?, parent_path=? WHERE id=?;";
	
	private ChapterDao() {
	}
}
