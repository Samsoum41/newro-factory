package com.samsoum.newro.ui.view;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;

import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.StagiaireDAO;
import com.samsoum.newro.service.StagiaireService;
import com.samsoum.newro.ui.Utilitaire;


public class StagiaireView {
	private static Scanner sc = new Scanner(System.in);
	private static String format = "%-20s%20s%20s%20s%20s%20s%n";

	public static void print(Stagiaire stagiaire) {
		System.out.printf(format, stagiaire.getId(), stagiaire.getFirst_name(), stagiaire.getLast_name(), stagiaire.getArrival(), stagiaire.getFormation_over(), stagiaire.getPromotion_id() + "   ");
	}
	public static void printAttributes() {
		System.out.printf(format, "id", "first_name ", "last_name", "arrival", "formation_over", "promotion_id   ");
	}
	public static void showOne() throws SQLException {
		int id = 0;
		System.out.println("Quel est l'id du stagaiaire que vous recherchez ?");
		id = Utilitaire.needInt("Ce n'est pas un entier ça, réessayez :");
		if(StagiaireService.doesExist(id)) {
			StagiaireView.printAttributes();
			StagiaireView.print(new StagiaireDAO().getOne(id));
		}
		else {
			System.out.println("Il n'y a aucun stagiaire à ce numéro d'id.");
		}
	}
	
	public static void showAll() throws SQLException {
		List<Stagiaire> stagiaires;
		boolean hasNextPage;
		while(true) {
			stagiaires = new StagiaireDAO().getPaginated();
			hasNextPage = new StagiaireDAO().hasNext();
			// Printing data
			StagiaireView.printAttributes();
			for (Stagiaire stagiaire : stagiaires) {
				StagiaireView.print(stagiaire);
			}
			// Printing controls
			if(StagiaireDAO.page!=1) {
				System.out.print(" <  pour passer à la page précédente  |");
			}
			if(hasNextPage){
				System.out.println(" > pour passer à la page suivante");
			}
			// Logic of skiping pages
			String arrow = Utilitaire.getArrowKey();
			if (arrow.equals(">") && hasNextPage) {
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
		formation_over = Utilitaire.askUSLocalDate();
		if(formation_over != null && !arrival.isBefore(formation_over)) {
			System.out.println("La date que vous avez renseignée est avant la date d'arrivée du stagiaire, c'est une erreur, réessaeyer :");
		}
		System.out.println("Quel est l'id de la promotion du stagiaire que vous souhaitez ajouter ?");
		int promotion_id = PromotionView.needOne().getId();
		new StagiaireDAO().add(new Stagiaire(first_name, last_name, arrival, formation_over, promotion_id));
	}
	public static void updateOne() throws SQLException {
		System.out.println("Quel est l'id du stagiaire que vous souhaitez modifier ?");
		int stagiaire_id = StagiaireView.needOne().getId();
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
		int promotion_id = PromotionView.needOne().getId();
		new StagiaireDAO().update(new Stagiaire(stagiaire_id,first_name, last_name, arrival, formation_over, promotion_id));
	}
	
	public static void deleteOne() throws SQLException {
		System.out.println("Quel est l'id du stagiaire que vous souhaitez supprimer ?");
		int id = Utilitaire.needInt("C'est pas un entier ça");
		if(StagiaireService.doesExist(id)) {
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
			if (StagiaireService.doesExist(id)) {
				return new StagiaireDAO().getOne(id);
			}
			else {
				System.out.println("Aucune stagiaire ne corresond à cet id, réessayez :");
			}
		}
	}
}
