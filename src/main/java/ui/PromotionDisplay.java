package ui;

import java.sql.SQLException;
import java.util.Scanner;

import data.model.Promotion;
import data.model.dao.PromotionDAO;

public class PromotionDisplay {
	private static Scanner sc = new Scanner(System.in);

	private static void showOnePromotion() throws SQLException {
		int id = 0;
		System.out.println("Quel est l'id de la promotion que vous recherchez ?");
		id = sc.nextInt();
		if(promotionExist(id)) {
			System.out.println(new PromotionDAO().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucune promotion à ce numéro d'id.");
		}
	}
	private static Promotion needPromotion() throws SQLException {
		int promotion_id = 0;
		while (promotion_id == 0) {
			promotion_id = sc.nextInt();
			try {
				return new PromotionDAO().getOne(promotion_id);
			}
			catch(SQLException e){
				promotion_id=0;
				System.out.println("Aucune promotion ne correpond à ce numéro");
				System.out.println("Tentez à nouveau :");
			}
		}
		return null;
	}
}
