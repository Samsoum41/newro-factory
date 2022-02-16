package ui;

import java.sql.SQLException;

import data.model.Promotion;
import data.model.dao.PromotionDAO;
import data.model.utilitaire.PromotionUtilitaire;

public class PromotionDisplay {
	public static void showOne() throws SQLException {
		System.out.println("Quel est l'id de la promotion que vous recherchez ?");
		int id = Utilitaire.needInt("Ce n'est pas un entier ! Réessayez :");
		if(PromotionUtilitaire.doesExist(id)) {
			System.out.println(new PromotionDAO().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucune promotion à ce numéro d'id.");
		}
	}
	
	public static Promotion needOne() throws SQLException {
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
