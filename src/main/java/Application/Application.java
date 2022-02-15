package Application;
import java.sql.SQLException;
import java.util.List;

import data.model.*;
import data.model.dao.*;


public class Application {
	public static void main(String[] args) throws SQLException {
		AnswerDAO myDao = new AnswerDAO();
		List<Answer> liste = myDao.getAll();
		List<Stagiaire> lis = new StagiaireDAO().getAll();
		List<Chapter> chapter = new ChapterDAO().getAll();
		for (Chapter stagiaire: chapter) {
			System.out.println(stagiaire);
		}
	}
}
