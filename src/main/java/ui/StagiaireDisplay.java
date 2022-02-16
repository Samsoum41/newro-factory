package ui;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;

import data.model.Stagiaire;
import data.model.dao.StagiaireDAO;
import data.model.utilitaire.StagiaireUtilitaire;

public class StagiaireDisplay {
	private static Scanner sc = new Scanner(System.in);
	public static void showOne() throws SQLException {
		int id = 0;
		System.out.println("Quel est l'id du stagaiaire que vous recherchez ?");
		id = Utilitaire.needInt("Ce n'est pas un entier ça, réessayez :");
		if(StagiaireUtilitaire.doesExist(id)) {
			StagiaireUtilitaire.print(new StagiaireDAO().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucun stagiaire à ce numéro d'id.");
		}
	}
	
	public static void showAll() throws SQLException {
		while(true) {
			StagiaireUtilitaire.printAttributes();
			List<Stagiaire> stagiaires = new StagiaireDAO().getPaginated();
			for (Stagiaire stagiaire : stagiaires) {
				StagiaireUtilitaire.print(stagiaire);
			}
			if(StagiaireDAO.page!=1) {
				System.out.print(" <  pour passer à la page précédente  |");
			}
			
			System.out.println(" > pour passer à la page suivante");
			String arrow = Utilitaire.getArrowKey();
			if (arrow.equals(">")) {
				StagiaireDAO.page +=1;
			}
			else if(arrow.equals("<") && StagiaireDAO.page !=1) {
				StagiaireDAO.page -=1;
			}
		}
	}
	public static void addOne() throws SQLException {
		System.out.println("Quel est le prénom du stagiaire que vous souhaitez ajouter ?");
		String first_name = Utilitaire.needNotEmptyString();
		System.out.println("Quel est le nom du stagiaire que vous souhaitez ajouter ?");
		String last_name = Utilitaire.needNotEmptyString();
		System.out.println("Quel est la date d'arrivée du stagiaire que vous souhaitez ajouter ?");
		System.out.println("Veuillez entrer la date au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		LocalDate arrival = Utilitaire.needLocalDate();
		System.out.println("Le stagiaire est-il partie ? Si oui, entrez la date de départ au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		System.out.println("Sinon, entrez une bêtise");
		LocalDate formation_over = null;
		while(formation_over == null || !arrival.isBefore(formation_over)){
			formation_over = Utilitaire.askUSLocalDate();
			if(!arrival.isBefore(formation_over)) {
				System.out.println("La date que vous avez renseignée est avant la date d'arrivée du stagiaire, c'est une erreur, réessaeyer :");
			}
		}
		System.out.println("Quel est l'id de la promotion du stagiaire que vous souhaitez ajouter ?");
		int promotion_id = PromotionDisplay.needOne().getId();
		new StagiaireDAO().add(new Stagiaire(first_name, last_name, arrival, formation_over, promotion_id));
	}
	public static void updateOne() throws SQLException {
		System.out.println("Quel est l'id du stagiaire que vous souhaitez modifier ?");
		int stagiaire_id = StagiaireDisplay.needOne().getId();
		System.out.println("Quel est le nouveau prénom du stagiaire ?");
		String first_name = sc.next();
		System.out.println("Quel est le nouveau nom du stagiaire ?");
		String last_name = sc.next();
		System.out.println("Quel est la nouvelle date d'arrivée du stagiaire ?");
		System.out.println("Veuillez entrer la date au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		LocalDate arrival = Utilitaire.needLocalDate();
		System.out.println("Vous avez entré : " + arrival);
		System.out.println("Le stagiaire est-il partie ? Si oui, entrez la nouvelle date de départ au format yyyy-MM-dd. Par exemple aujourd'hui on est le " + LocalDate.now());
		System.out.println("Sinon, entrez une bêtise");
		LocalDate formation_over = null;
		while(formation_over == null || !arrival.isBefore(formation_over)){
			formation_over = Utilitaire.askUSLocalDate();
			if(!arrival.isBefore(formation_over)) {
				System.out.println("La date que vous avez renseignée est avant la date d'arrivée du stagiaire, c'est une erreur, réessaeyer :");
			}
		}
		System.out.println("Quel est le nouvel id de la promotion du stagiaire que vous souhaitez modifier ?");
		int promotion_id = PromotionDisplay.needOne().getId();
		new StagiaireDAO().update(new Stagiaire(stagiaire_id,first_name, last_name, arrival, formation_over, promotion_id));
	}
	
	public static void deleteOne() throws SQLException {
		System.out.println("Quel est l'id du stagiaire que vous souhaitez supprimer ?");
		int id = Utilitaire.needInt("C'est pas un entier ça");
		if(StagiaireUtilitaire.doesExist(id)) {
			new StagiaireDAO().delete(id);
		}
		else {
			System.out.println("Il n'y a aucun stagiaire à ce numéro d'id.");
		}
	}
	
	public static Stagiaire needOne() throws SQLException {
		int id = 0;
		while (true) {
			id = Utilitaire.needInt("Ce n'est pas un entier coco, réessaye :");
			if (StagiaireUtilitaire.doesExist(id)) {
				return new StagiaireDAO().getOne(id);
			}
			else {
				System.out.println("Aucune stagiaire ne corresond à cet id, réessayez :");
			}
		}
	}
}
