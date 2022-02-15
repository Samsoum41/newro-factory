package data.model.utilitaire;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Scanner;

import data.model.Stagiaire;
import data.model.dao.PromotionDAO;
import data.model.dao.StagiaireDAO;
import ui.Cli;

public class StagiaireUtilitaire {
	private static Scanner sc = new Scanner(System.in);
	private static boolean doesExist(int id){
		try {
			new StagiaireDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}

	private static void delete() throws SQLException {
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
