package data.model.utilitaire;

import java.sql.SQLException;
import java.util.Scanner;

import data.model.dao.PromotionDAO;

public class PromotionUtilitaire {
	private static Scanner sc = new Scanner(System.in);
	
	private static boolean doesExist(int id) {
		try {
			new PromotionDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}
}
