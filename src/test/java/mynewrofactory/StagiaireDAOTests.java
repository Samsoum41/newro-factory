package mynewrofactory;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import org.h2.tools.RunScript;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.samsoum.newro.mapper.MapperException;
import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.DataSource;
import com.samsoum.newro.persistence.StagiaireDAO;

class StagiaireDAOTests {
	@Mock
	private StagiaireMapper mapper;

	@Test
	public void addStagiaireWithCorrectInputShouldWork()  {
		// Création d'un stagiaire
		String first_name = "Hamzouille";
		String last_name = "LaPotatoe";
		Promotion promotion = new Promotion(1, "Février 2022");
		LocalDate arrival = LocalDate.of(2022, 2, 22);
		LocalDate departure = LocalDate.of(2022, 3, 23);
		Stagiaire stagiaire = new Stagiaire(first_name, last_name, arrival, departure, promotion);
		// Mock du mapper
		try {
			String query = """
					INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id) 
					VALUES('Hamzouille', 'LaPotatoe', '2022-02-22','2022-03-23',1);
					""";
			PreparedStatement statement = DataSource.getInstance().getConnection().prepareStatement(query);
			when(mapper.toStatement(any(Stagiaire.class), any(PreparedStatement.class))).thenReturn(statement);
		} catch (MapperException | SQLException | DAOException e) {
			e.printStackTrace();
			fail();
		}
		// Fonction à tester :
		try {
			StagiaireDAO.getInstance().add(stagiaire);
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
		// Si on est là, c'est que c'est bon
	}

	@Test
	public void shouldReturnAdrienneMazeyFromId() {
		Stagiaire realAdrienne = new Stagiaire(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12), 
												LocalDate.of(2014, 5, 13), new Promotion(1, "Février 2022"));
		Stagiaire testAdrienne;
		try {
			testAdrienne = StagiaireDAO.getInstance().getOne(1).get();
			System.out.println(testAdrienne);
			assertEquals(testAdrienne, realAdrienne);
		} catch (DAOException e) {
			fail();
		}
	}
	@Test
	public void shouldReturnAdrienneMazeyFromNames() {
		Stagiaire realAdrienne = new Stagiaire(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12), 
												LocalDate.of(2014, 5, 13), new Promotion(1, "Février 2022"));
		Stagiaire testAdrienne;
		try {
			testAdrienne = StagiaireDAO.getInstance().getByNames("Adrienne", "Mazet").get();
			System.out.println(testAdrienne);
			assertEquals(testAdrienne, realAdrienne);
		} catch (DAOException e) {
			fail();
		}
	}
	
	
	@BeforeEach
	public void setupDatabase() throws FileNotFoundException, DAOException, SQLException {
		try (Connection con = DataSource.getInstance().getConnection()) {
			/**
			 * Création des tables et de 3 enregistrements dans la table promotion : id |
			 * name 1 Février 2022 2 Mars 2023 3 Janvier 2021
			 */
			String path = "/home/oxyl/1-SCHEMA-StagiaireDAOTest.sql";
			RunScript.execute(con, new FileReader(path));
		}
		// Initialisation des annotations mockito
		MockitoAnnotations.openMocks(this);
	}
}
