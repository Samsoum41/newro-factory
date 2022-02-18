
package com.samsoum.newro.ui;

import java.sql.SQLException;
import java.util.Scanner;

import com.samsoum.newro.ui.view.PromotionView;
import com.samsoum.newro.ui.view.QuestionView;
import com.samsoum.newro.ui.view.StagiaireView;

public class Controlleur {
	private static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) throws SQLException {
		Controlleur.start();
		boolean chosen = false;
		int choice = 0;
		while(!chosen) {
			choice = sc.nextInt();
			if (choice<8 && choice >0) {
				chosen = true;
			}
			else {
				System.out.println("Veuillez entrer un nombre entre 1 et 7");
			}
		}
		switch(choice) {
		case 1:
			StagiaireView.showAll();
			break;
		case 2:
			PromotionView.showAll();
			break;
		case 3: 
			StagiaireView.showOne();
			break;
		case 4:
			QuestionView.showOne();
			break;
		case 5: 
			StagiaireView.addOne();
			break;
		case 6:
			StagiaireView.updateOne();
			break;
		case 7:
			StagiaireView.deleteOne();
			break;
			
		}
	}
	private static void start(){
		System.out.println("Bienvenue dans le newro-factory.");
		System.out.println("Ici, on prépare l'OCA en 1 semaine");
		System.out.println("");
		System.out.println("Choisissez l'opération que vous souhaitez réaliser :");
		System.out.println("1. Lister les stagiaires");
		System.out.println("2. Lister les promotions");
		System.out.println("3. Afficher le détail d'un stagiaire");
		System.out.println("4. Afficher le détail d'une question");
		System.out.println("5. Créer un stagiaire");
		System.out.println("6. Editer un stagiaire");
		System.out.println("7. Supprimer un stagiaire");
		System.out.println("");
		System.out.println("A vous :");
	}
}

