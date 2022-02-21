package com.samsoum.newro.ui.view;

import java.sql.SQLException;
import java.util.List;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.persistence.PromotionDAO;
import com.samsoum.newro.service.PromotionService;
import com.samsoum.newro.ui.Utilitaire;

public class PromotionView {
	private static String format = "%-20s%20s%n";

	public static void print(Promotion promotion) {
		System.out.printf(format, promotion.getId(), promotion.getName() + "   ");
	}	
	public static void printAttributes() {
		System.out.printf(format, "id", "name   ");
	}
	
	public static void showOne() throws SQLException {
		System.out.println("Quel est l'id de la promotion que vous recherchez ?");
		int id = Utilitaire.needInt("Ce n'est pas un entier ! Réessayez :");
		if(PromotionService.doesExist(id)) {
			PromotionView.printAttributes();
			PromotionView.print(PromotionService.getInstance().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucune promotion à ce numéro d'id.");
		}
	}
	
	public static Promotion needOne() throws SQLException {
		int promotion_id = 0;
		while (true) {
			promotion_id = Utilitaire.needInt("Ce n'est pas un entier coco, réessaye :");
			if (PromotionService.doesExist(promotion_id)) {
				return PromotionService.getInstance().getOne(promotion_id);
			}
			else {
				System.out.println("Aucune promotion ne corresond à cet id, réessayez :");
			}
		}
	}
	
	public static void showAll() throws SQLException {
		while(true) {
			List<Promotion> promotions = PromotionService.getInstance().getPaginated();
			PromotionView.printAttributes();
			for (Promotion promotion : promotions) {
				PromotionView.print(promotion);
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
