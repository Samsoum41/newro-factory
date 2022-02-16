package data.model.utilitaire;

import java.sql.SQLException;

import data.model.Stagiaire;
import data.model.dao.StagiaireDAO;

public class StagiaireUtilitaire {	
	private static String format = "%-20s%20s%20s%20s%20s%20s%n";
	
	public static boolean doesExist(int id){
		try {
			new StagiaireDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}
	
	public static void print(Stagiaire stagiaire) {
		System.out.printf(format, stagiaire.getId(), stagiaire.getFirst_name(), stagiaire.getLast_name(), stagiaire.getArrival(), stagiaire.getFormation_over(), stagiaire.getPromotion_id() + "   ");
	}
	public static void printAttributes() {
		System.out.printf(format, "id", "first_name ", "last_name", "arrival", "formation_over", "promotion_id   ");
	}
}
