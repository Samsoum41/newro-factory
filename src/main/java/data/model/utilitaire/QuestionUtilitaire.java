package data.model.utilitaire;

import java.sql.SQLException;

import data.model.Question;
import data.model.dao.QuestionDAO;

public class QuestionUtilitaire {

	public static boolean doesExist(int id) {
		try {
			new QuestionDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}	
}
