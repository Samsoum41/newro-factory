package data.model.utilitaire;

import java.sql.SQLException;

import data.model.Promotion;
import data.model.dao.PromotionDAO;
import ui.Utilitaire;

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
	public static Promotion needPromotion() throws SQLException {
		int promotion_id = 0;
		while (true) {
			promotion_id = Utilitaire.needInt("Ce n'est pas un entier coco, réessaye :");
			if (PromotionUtilitaire.doesExist(promotion_id)) {
				return new PromotionDAO().getOne(promotion_id);
			}
			else {
				System.out.println("Aucune promotion ne corresond à cet id, réessayez :");
			}
		}
	}
}
