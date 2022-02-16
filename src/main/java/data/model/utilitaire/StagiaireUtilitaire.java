package data.model.utilitaire;

import java.sql.SQLException;

import data.model.Stagiaire;
import data.model.dao.StagiaireDAO;
import ui.Utilitaire;

public class StagiaireUtilitaire {	
	public static boolean doesExist(int id){
		try {
			new StagiaireDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}
	public static Stagiaire needStagiaire() throws SQLException {
		int id = 0;
		while (true) {
			id = Utilitaire.needInt("Ce n'est pas un entier coco, réessaye :");
			if (StagiaireUtilitaire.doesExist(id)) {
				return new StagiaireDAO().getOne(id);
			}
			else {
				System.out.println("Aucune stagiaire ne corresond à cet id, réessayez :");
			}
		}
	}

	public static void delete() throws SQLException {
		System.out.println("Quel est l'id du stagiaire que vous souhaitez supprimer ?");
		int id = 0;
		if(doesExist(id)) {
			new StagiaireDAO().delete(id);
		}
		else {
			System.out.println("Il n'y a aucun stagiaire à ce numéro d'id.");
		}
	}
}
