package ui;

import java.sql.SQLException;
import java.util.List;

import data.model.Question;
import data.model.dao.QuestionDAO;
import data.model.utilitaire.QuestionUtilitaire;

public class QuestionDisplay {
	public static void showOne() throws SQLException {
		System.out.println("Quel est l'id de la question que vous recherchez ?");
		int id = Utilitaire.needInt("Ce n'est pas un entier ! Réessayez :");
		if(QuestionUtilitaire.doesExist(id)) {
			System.out.println(new QuestionDAO().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucune question à ce numéro d'id.");
		}
	}
	
	public static Question needOne() throws SQLException {
		int question_id = 0;
		while (true) {
			question_id = Utilitaire.needInt("Ce n'est pas un entier coco, réessaye :");
			if (QuestionUtilitaire.doesExist(question_id)) {
				return new QuestionDAO().getOne(question_id);
			}
			else {
				System.out.println("Aucune question ne corresond à cet id, réessayez :");
			}
		}
	}
	
	public static void showAll() throws SQLException {
		while(true) {
			List<Question> questions = new QuestionDAO().getPaginated();
			for (Question question : questions) {
				System.out.println(question);
			}
			if(QuestionDAO.page!=1) {
				System.out.print(" <  pour passer à la page précédente  |");
			}
			
			System.out.println(" > pour passer à la page suivante");
			String arrow = Utilitaire.getArrowKey();
			if (arrow.equals(">")) {
				QuestionDAO.page +=1;
			}
			else if(arrow.equals("<") && QuestionDAO.page !=1) {
				QuestionDAO.page -=1;
			}
		}
	}
}
