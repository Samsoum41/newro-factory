package data.model.utilitaire;

import java.sql.SQLException;

import data.model.dao.PromotionDAO;

public class PromotionUtilitaire {
	public static boolean doesExist(int id) {
		try {
			new PromotionDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}	
}
