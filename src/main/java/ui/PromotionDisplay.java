package ui;

import java.sql.SQLException;
import java.util.List;

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
	
	public static void showAll() throws SQLException {
		while(true) {
			List<Promotion> promotions = new PromotionDAO().getPaginated();
			for (Promotion promotion : promotions) {
				System.out.println(promotion);
			}
			if(PromotionDAO.page!=1) {
				System.out.print(" <  pour passer à la page précédente  |");
			}
			
			System.out.println(" > pour passer à la page suivante");
			String arrow = Utilitaire.getArrowKey();
			if (arrow.equals(">")) {
				PromotionDAO.page +=1;
			}
			else if(arrow.equals("<") && PromotionDAO.page !=1) {
				PromotionDAO.page -=1;
			}
		}
	}

}
