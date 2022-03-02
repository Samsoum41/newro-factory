package mynewrofactory;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import org.h2.tools.RunScript;
import org.junit.jupiter.api.Test;

import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.DatabaseConnection;
import com.samsoum.newro.persistence.PromotionDAO;
import com.samsoum.newro.persistence.StagiaireDAO;

class TestDAO {

	@Test
	public void test() throws DAOException, FileNotFoundException, SQLException {
		// Création d'un stagiaire
		this.setup();
		
		Promotion promotion = new Promotion("Février 2022");
		LocalDate arrival = LocalDate.of(2022, 2, 22);
		LocalDate departure = LocalDate.of(2022, 3, 23);
		Stagiaire stagiaire = new Stagiaire("Hamzouille2", "LaPotatoe", arrival, departure, promotion);
		
//		try {
//			List<Promotion> questions = PromotionDAO.getInstance().getAll();
//			for (Promotion quest : questions) {
//				System.out.println(quest);
//			}		
//			//StagiaireDAO.getInstance().add(stagiaire);
//		} catch (DAOException e) {
//			fail();
//		}
		//tagiaire returnedStagiaire = StagiaireDAO.getInstance().getAll().get(0);
		//System.out.println(returnedStagiaire);
		//assertNotNull(returnedStagiaire);
		
	}

	public void setup() throws FileNotFoundException, DAOException, SQLException {
		Connection con = DatabaseConnection.getConnection();
			// Creating tables
			ClassLoader classLoader = getClass().getClassLoader();
			String path = "/home/oxyl/1-SCHEMA.sql";
			System.out.println(path); 
			RunScript.execute(con, new FileReader(path));
			// Creating a promotion for tests
			Promotion promotion = new Promotion("Hamzouille");
			//PromotionDAO.getInstance().add(promotion);
			System.out.println(PromotionDAO.getInstance().getOne(4));
			List<Promotion> questions = PromotionDAO.getInstance().getAll();
			for (Promotion quest : questions) {
				System.out.println(quest);
			}		
		
	}

}
