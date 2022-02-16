package data.model.utilitaire;

import java.sql.SQLException;

import data.model.Question;
import data.model.dao.QuestionDAO;

public class QuestionUtilitaire {
	private static String format = "%-20s%20s%20s%20s%20s%20s%n";

	public static boolean doesExist(int id) {
		try {
			new QuestionDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}	
	public static void print(Question question) {
		System.out.printf(format, question.getId(), question.getStatement(), question.getChapter_id());
	}
	public static void printAttributes() {
		System.out.printf(format, "id", "title ", "statement", "chapter_id   ");
	}
}
