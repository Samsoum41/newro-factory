package com.samsoum.newro.model;

import java.util.Objects;

public class Question {
	private int id;
	private String title;
	private String statement;
	private int chapterId;

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
		return Objects.hash(chapterId, id, statement, title);
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
		return chapterId == other.chapterId && id == other.id && Objects.equals(statement, other.statement)
				&& Objects.equals(title, other.title);
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", statement=" + statement + ", chapterId=" + chapterId
				+ "]";
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Question(int id, String title, String statement, int chapterId) {
		super();
		this.id = id;
		this.title = title;
		this.statement = statement;
		this.chapterId = chapterId;
	}

	public String getStatement() {
		return statement;
	}

	public void setStatement(String statement) {
		this.statement = statement;
	}

	public int getChapterId() {
		return chapterId;
	}

	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}

}
