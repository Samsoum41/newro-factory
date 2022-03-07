package com.samsoum.newro.ui;

import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.QuestionDAO;

public class Cli {
	public static void main(String[] args) {
		try {
			QuestionDAO.getInstance().delete(4128);
		} catch ( DAOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
