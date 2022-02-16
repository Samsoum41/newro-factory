package ui;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Scanner;

public class Utilitaire {
	private static Scanner sc = new Scanner(System.in);
	
	public static LocalDate askUSLocalDate() {
		LocalDate date = null;			
		String dateString = sc.nextLine();
		try {
			date = LocalDate.parse(dateString); 
			return date;
		}
		catch(Exception e) {
			System.out.println("Vous avez entré une date au mauvais format. Fripouille va !");
			return null;
		}
	}
	
	public static LocalDate needLocalDate() throws SQLException{
		LocalDate arrival = null;
		while (arrival == null) {
			arrival = askUSLocalDate();
			if (arrival == null) {
				System.out.println("Réessayer svp :");
			}
		}
		return null;
	}
	
	public static int needInt(String errorMessage) {
		// On est sur que result sera modifie
		int result=0;
		boolean chosen = false;
		while(!chosen) {
			try {
				result = sc.nextInt();
				chosen=true;
			}
			catch(Exception e){
				System.out.println(errorMessage);
			}
		}
		return result;
	}
	
	public static String needNotEmptyString(String errorMessage) {
		String result = null;
		while(result == null) {
			result = sc.nextLine();
			if (result == null) {
				System.out.println(errorMessage);
			}
		}
		return result;
	}
	public static String needNotEmptyString() {
		String result = null;
		while(result == null) {
			result = sc.nextLine();
			if (result == null) {
				System.out.println("Le champ est vide, veuillez entrer une valeur non nulle :");
			}
		}
		return result;
	}
}
