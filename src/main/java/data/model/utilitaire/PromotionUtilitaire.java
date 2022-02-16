package data.model.utilitaire;

import java.sql.SQLException;

import data.model.Promotion;
import data.model.dao.PromotionDAO;

public class PromotionUtilitaire {
	private static String format = "%-20s%20s%20s%20s%20s%20s%n";

	public static boolean doesExist(int id) {
		try {
			new PromotionDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}	
	public static void print(Promotion promotion) {
		System.out.printf(format, promotion.getId(), promotion.getName() + "   ");
	}	
	public static void printAttributes() {
		System.out.printf(format, "id", "name   ");
	}
}
