package ui;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Scanner;

import data.model.Stagiaire;
import data.model.dao.PromotionDAO;
import data.model.dao.StagiaireDAO;

public class StagiaireDisplay {
	private static Scanner sc = new Scanner(System.in);
	private static void showOne() throws SQLException {
		int id = 0;
		System.out.println("Quel est l'id du stagaiaire que vous recherchez ?");
		id = sc.nextInt();
		if(doesExist(id)) {
			System.out.println(new StagiaireDAO().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucun stagiaire à ce numéro d'id.");
		}
	}
	private static void addStagiaire() throws SQLException {
		System.out.println("Quel est le prénom du stagiaire que vous souhaitez ajouter ?");
		String first_name = sc.next();
		System.out.println("Quel est le nom du stagiaire que vous souhaitez ajouter ?");
		String last_name = sc.next();
		System.out.println("Quel est la date d'arrivée du stagiaire que vous souhaitez ajouter ?");
		System.out.println("Veuillez entrer la date au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		LocalDate arrival = Cli.needLocalDate();
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
}
