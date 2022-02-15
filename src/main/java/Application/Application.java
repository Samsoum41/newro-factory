package Application;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import java.util.List;

import data.model.*;
import data.model.dao.*;


public class Application {
	public static void main(String[] args) throws SQLException {
		AnswerDAO myDao = new AnswerDAO();
		List<Answer> liste = myDao.getAll();
		List<Stagiaire> lis = new StagiaireDAO().getAll();
		List<Chapter> chapter = new ChapterDAO().getAll();
		Stagiaire stagiaire = new Stagiaire("Sarah", "Hocine", LocalDate.of(2022, Month.FEBRUARY, 12), 2);
		new StagiaireDAO().add(stagiaire);
	}
}
