package com.samsoum.newro.model;


public class Answer {
	private int id;
	private String label;
	private String text;
	private int valid_answer;
	public void setValid_answer(int valid_answer) {
		this.valid_answer = valid_answer;
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
	public Answer(int id, String label, String text, int valid_answer, int question_id) {
		super();
		this.id = id;
		this.label = label;
		this.text = text;
		this.valid_answer = valid_answer;
		this.question_id = question_id;
	}
	public void setText(String text) {
		this.text = text;
	}

	public int getValid_answer() {
		return valid_answer;
	}
	public void setValid_answer(short valid_answer) {
		this.valid_answer = valid_answer;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	@Override
	public String toString() {
		return (this.id + " "+  this.label + " " + this.text);
	}
	
	@Override
    public boolean equals(Object o) {
		if (o == this) {
			return true;
		}
		if (!(o instanceof Answer)) {
			return false;
		}
		else {
			Answer ans = (Answer) o;
			return this.label.equals(ans.getLabel()) &&
					this.question_id == ans.getQuestion_id() &&
					this.text.equals(ans.getText()) &&
					this.valid_answer == ans.getValid_answer();
					
		}
	}
}