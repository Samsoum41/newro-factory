package com.samsoum.newro.model;

public class Question {
	private int id;
	private String title;
	private String statement;
	private int chapter_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", statement=" + statement + ", chapter_id=" + chapter_id
				+ "]";
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Question(int id, String title, String statement, int chapter_id) {
		super();
		this.id = id;
		this.title = title;
		this.statement = statement;
		this.chapter_id = chapter_id;
	}
	public String getStatement() {
		return statement;
	}
	public void setStatement(String statement) {
		this.statement = statement;
	}
	public int getChapter_id() {
		return chapter_id;
	}
	public void setChapter_id(int chapter_id) {
		this.chapter_id = chapter_id;
	}
	 
}
