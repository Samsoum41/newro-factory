package com.samsoum.newro.model;

import java.util.Objects;

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
	public int hashCode() {
		return Objects.hash(chapter_id, id, statement, title);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Question other = (Question) obj;
		return chapter_id == other.chapter_id && id == other.id && Objects.equals(statement, other.statement)
				&& Objects.equals(title, other.title);
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
