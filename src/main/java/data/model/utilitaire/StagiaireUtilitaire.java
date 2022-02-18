package data.model.utilitaire;

import java.sql.SQLException;

import data.model.dao.StagiaireDAO;

public class StagiaireUtilitaire {		
	public static boolean doesExist(int id){
		try {
			new StagiaireDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}
}
