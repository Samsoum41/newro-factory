package ui;

import java.sql.SQLException;

import data.model.dao.PromotionDAO;
import data.model.utilitaire.PromotionUtilitaire;

public class PromotionDisplay {
	public static void showOnePromotion() throws SQLException {
		System.out.println("Quel est l'id de la promotion que vous recherchez ?");
		int id = Utilitaire.needInt("Ce n'est pas un entier ! Réessayez :");
		if(PromotionUtilitaire.doesExist(id)) {
			System.out.println(new PromotionDAO().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucune promotion à ce numéro d'id.");
		}
	}
}
