package ui;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Scanner;

public class Utilitaire {
	private static Scanner sc = new Scanner(System.in);
	
	private static LocalDate askUSLocalDate() {
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
	
	private static LocalDate needLocalDate() throws SQLException{
		LocalDate arrival = null;
		while (arrival == null) {
			arrival = askUSLocalDate();
			if (arrival == null) {
				System.out.println("Réessayer svp :");
			}
		}
		return null;
	}
}
