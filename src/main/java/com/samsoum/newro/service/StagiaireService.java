package com.samsoum.newro.service;

import java.sql.SQLException;

import com.samsoum.newro.persistence.StagiaireDAO;

public class StagiaireService {
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
