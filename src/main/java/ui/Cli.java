package ui;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Scanner;

import data.model.Stagiaire;
import data.model.dao.PromotionDAO;
import data.model.dao.StagiaireDAO;

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
			System.out.println(new StagiaireDAO().getAll());
			break;
		case 2:
			System.out.println(new PromotionDAO().getAll());
			break;
		case 3: 
			showOneStagiaire();
			break;
		case 4:
			showOnePromotion();
			break;
		case 5: 
			addStagiaire();
			break;
		case 6:
			updateStagiaire();
			break;
		case 7:
			deleteStagiaire();
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
	private static void addStagiaire() throws SQLException {
		System.out.println("Quel est le prénom du stagiaire que vous souhaitez ajouter ?");
		String first_name = sc.next();
		System.out.println("Quel est le nom du stagiaire que vous souhaitez ajouter ?");
		String last_name = sc.next();
		System.out.println("Quel est la date d'arrivée du stagiaire que vous souhaitez ajouter ?");
		System.out.println("Veuillez entrer la date au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		LocalDate arrival = null;
		while (arrival == null) {
			String arrivalString = sc.nextLine();
			try {
				arrival = LocalDate.parse(arrivalString); 
			}
			catch(Exception e) {
				System.out.println("Vous avez entré une date au mauvais format. Fripouille va !");
			}
		}
		System.out.println("Le stagiaire est-il partie ? Si oui, entrez la date de départ au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		System.out.println("Sinon, entrez une bêtise");
		LocalDate formation_over = askUSLocalDate();
		System.out.println("Quel est l'id de la promotion du stagiaire que vous souhaitez ajouter ?");
		int promotion_id = 0;
		while (promotion_id == 0) {
			promotion_id = sc.nextInt();
			try {
				new PromotionDAO().getOne(promotion_id);
			}
			catch(SQLException e){
				promotion_id=0;
				System.out.println(e.getMessage());
				System.out.println("Le numéro ne correpond à aucun objet");
			}
		}
		new StagiaireDAO().add(new Stagiaire(first_name, last_name, arrival, formation_over, promotion_id));
	}
	
	private static void updateStagiaire() throws SQLException {
		System.out.println("Quel est l'id du stagiaire que vous souhaitez modifier ?");
		int stagiaire_id = 0;
		while (stagiaire_id == 0) {
			stagiaire_id = sc.nextInt();
			try {
				new PromotionDAO().getOne(stagiaire_id);
			}
			catch(SQLException e){
				stagiaire_id=0;
				System.out.println("Aucun stagiaire ne correpond à ce numéro");
			}
		}
		System.out.println("Quel est le nouveau prénom du stagiaire ?");
		String first_name = sc.next();
		System.out.println("Quel est le nouveau nom du stagiaire ?");
		String last_name = sc.next();
		System.out.println("Quel est la nouvelle date d'arrivée du stagiaire ?");
		System.out.println("Veuillez entrer la date au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		LocalDate arrival = null;
		while (arrival == null) {
			String arrivalString = sc.nextLine();
			try {
				arrival = LocalDate.parse(arrivalString); 
			}
			catch(Exception e) {
			}
		}
		System.out.println("Le stagiaire est-il partie ? Si oui, entrez la nouvelle date de départ au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		System.out.println("Sinon, entrez une bêtise");
		LocalDate formation_over = LocalDate.parse(sc.nextLine());
		System.out.println("Quel est le nouvel id de la promotion du stagiaire que vous souhaitez modifier ?");
		int promotion_id = 0;
		while (promotion_id == 0) {
			promotion_id = sc.nextInt();
			try {
				new PromotionDAO().getOne(promotion_id);
			}
			catch(SQLException e){
				promotion_id=0;
				System.out.println("Aucune promotion ne correpond à ce numéro");
			}
		}
		new StagiaireDAO().update(new Stagiaire(stagiaire_id,first_name, last_name, arrival, formation_over, promotion_id));
	}
	
	private static void showOneStagiaire() {
		int id = 0;
		while(id==0) {
			System.out.println("Quel est l'id du stagaiaire que vous recherchez ?");
			id = sc.nextInt();
			try {
				System.out.println(new StagiaireDAO().getOne(id));;
			}
			catch(SQLException e) {
				System.out.println("Il n'y a aucun stagiaire à ce numéro d'id.");
			}
		}
	}
	private static void showOnePromotion() {
		int id = 0;
		while(id==0) {
			System.out.println("Quel est l'id de la promotion que vous recherchez ?");
			id = sc.nextInt();
			try {
				System.out.println(new PromotionDAO().getOne(id));
			}
			catch(SQLException e) {
				System.out.println("Il n'y a aucune promotion à ce numéro d'id.");
			}
		}
	}
	
	private static void deleteStagiaire() throws SQLException {
		System.out.println("Quel est l'id du stagiaire que vous souhaitez supprimer ?");
		int stagiaire_id = 0;
		while (stagiaire_id == 0) {
			stagiaire_id = sc.nextInt();
			try {
				new PromotionDAO().getOne(stagiaire_id);
			}
			catch(SQLException e){
				stagiaire_id=0;
				System.out.println("Aucun stagiaire ne correpond à ce numéro");
			}
		}
		new StagiaireDAO().delete(stagiaire_id);
	}
	private static LocalDate askUSLocalDate() {
		LocalDate date = null;			
		String dateString = sc.nextLine();
		try {
			date = LocalDate.parse(dateString); 
			return date;
		}
		catch(Exception e) {
			System.out.println("La date n'est pas au bon format, fripouille va !");
			return null;
		}
	}

}
