package com.samsoum.newro.model;

import java.util.Objects;

public class Answer {
	private int id;
	private String label;
	private String text;
	private int validAnswer;

	public void setValidAnswer(int validAnswer) {
		this.validAnswer = validAnswer;
	}

	private int question_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getText() {
		return text;
	}

	public Answer(int id, String label, String text, int validAnswer, int question_id) {
		super();
		this.id = id;
		this.label = label;
		this.text = text;
		this.validAnswer = validAnswer;
		this.question_id = question_id;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getValidAnswer() {
		return validAnswer;
	}

	public void setValidAnswer(short validAnswer) {
		this.validAnswer = validAnswer;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	@Override
	public String toString() {
		return (this.id + " " + this.label + " " + this.text);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, label, question_id, text, validAnswer);
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
		Answer other = (Answer) obj;
		return id == other.id && Objects.equals(label, other.label) && question_id == other.question_id
				&& Objects.equals(text, other.text) && validAnswer == other.validAnswer;
	}
}
