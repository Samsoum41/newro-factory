package ui;

import java.sql.SQLException;
import java.util.Scanner;

public class Cli {
	private static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) throws SQLException {
		Cli.start();
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
			StagiaireDisplay.showAll();
			break;
		case 2:
			PromotionDisplay.showAll();
			break;
		case 3: 
			StagiaireDisplay.showOne();
			break;
		case 4:
			QuestionDisplay.showOne();
			break;
		case 5: 
			StagiaireDisplay.addOne();
			break;
		case 6:
			StagiaireDisplay.updateOne();
			break;
		case 7:
			StagiaireDisplay.deleteOne();
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
