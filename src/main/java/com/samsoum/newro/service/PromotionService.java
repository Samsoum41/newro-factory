package com.samsoum.newro.service;

import java.sql.SQLException;

import com.samsoum.newro.persistence.PromotionDAO;

public class PromotionService {
	public static boolean doesExist(int id) {
		try {
			new PromotionDAO().getOne(id);
			return true;
		}
		catch(SQLException e) {
			return false;
		}
	}		
}
