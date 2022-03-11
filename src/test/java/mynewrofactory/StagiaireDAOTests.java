package mynewrofactory;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

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
import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.ui.PageStagiaire;
import com.samsoum.newro.util.Context;

class StagiaireDAOTests {
	@Mock
	private StagiaireMapper mapper;
	private StagiaireDAO dao;

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
			dao.add(stagiaire);
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
		// Si on est là, c'est que c'eLes getters sont bonsst bon
	}

	@Test
	public void shouldReturnAdrienneMazeyFromId() {
		Stagiaire realAdrienne = new Stagiaire(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12), 
												LocalDate.of(2014, 5, 13), new Promotion(1, "Février 2022"));
		Stagiaire testAdrienne;
		try {
			testAdrienne = dao.getOne(1).get();
			assertEquals(testAdrienne, realAdrienne);
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	@Test
	public void shouldReturnAdrienneMazeyFromNames() {
		Stagiaire realAdrienne = new Stagiaire(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12), 
												LocalDate.of(2014, 5, 13), new Promotion(1, "Février 2022"));
		Stagiaire testAdrienne;
		try {
			testAdrienne = dao.getByNames("Adrienne", "Mazet").get();
			assertEquals(testAdrienne, realAdrienne);
		} catch (DAOException e) {
			fail();
		}
	}
	
	@Test
	public void shouldDeleteStagiaireThatExists() {
		int deletAdrienneResult;
		int deleteAngeleResult;
		try {
			deletAdrienneResult = dao.delete(1);
			deleteAngeleResult = dao.delete(2);
			assertTrue(deletAdrienneResult>0);
			assertTrue(deleteAngeleResult>0);
		}
		catch(DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@Test
	public void shouldNotDeleteStagiaireThatDoesNotExist() {
		// Il n'y a aucun stagiaire d'id 1000
		try {
			int i = dao.delete(1000);
			assertEquals(0, i);
		}
		catch(DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@Test
	public void shouldReturnStagiairesOrderedByFirstNamePage() {
		try {
			PageStagiaire page = dao.getOrderdAndPaginatedAndFiltered(StagiaireField.FIRST_NAME, 1, 10);
			List<Stagiaire> stagiaires = page.getContenu();
			assertEquals("Achille", stagiaires.get(0).getFirst_name());
			assertEquals("Adrienne", stagiaires.get(1).getFirst_name());
			assertEquals("Angèle", stagiaires.get(2).getFirst_name());
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@Test
	public void shouldReturnStagiairesOrderedByLastNamePage() {
		try {
			PageStagiaire page = dao.getOrderdAndPaginatedAndFiltered(StagiaireField.LAST_NAME, 1, 10);
			List<Stagiaire> stagiaires = page.getContenu();
			assertEquals("Charbonnier", stagiaires.get(0).getLast_name());
			assertEquals("Cochet", stagiaires.get(1).getLast_name());
			assertEquals("Mazet", stagiaires.get(2).getLast_name());

		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@Test
	public void shouldReturnStagiairesOrderedByArrivalPage() {
		try {
			PageStagiaire page = dao.getOrderdAndPaginatedAndFiltered(StagiaireField.ARRIVAL, 1, 10);
			List<Stagiaire> stagiaires = page.getContenu();
			assertEquals("Adrienne", stagiaires.get(0).getFirst_name());
			assertEquals("Angèle", stagiaires.get(1).getFirst_name());
			assertEquals("Achille", stagiaires.get(2).getFirst_name());
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@Test
	public void shouldReturnStagiairesOrderedByFormationOverPage() {
		try {
			PageStagiaire page = dao.getOrderdAndPaginatedAndFiltered(StagiaireField.FORMATION_OVER, 1, 10);
			List<Stagiaire> stagiaires = page.getContenu();
			assertEquals("Angèle", stagiaires.get(0).getFirst_name());
			assertEquals("Adrienne", stagiaires.get(1).getFirst_name());
			assertEquals("Achille", stagiaires.get(2).getFirst_name());
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@Test
	public void shouldReturnFilteredByFirstNameAndOrderedByLastNamePage() {
		try {
			String recherche = "ien";
			PageStagiaire page = dao.getOrderdAndPaginatedAndFiltered(StagiaireField.LAST_NAME, StagiaireField.FIRST_NAME, recherche, 1, 10);
			List<Stagiaire> stagiaires = page.getContenu();
			assertEquals(1,stagiaires.size());
			assertEquals("Adrienne", stagiaires.get(0).getFirst_name());
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}	
	
	@Test
	public void shouldReturnFilteredByLastNameAndOrderedByArrivalPage() {
		try {
			//Dans H2 c'est sensible à la casse, si je recherche 'c' et 'C' c'est pas pareil
			String recherche = "C";
			PageStagiaire page = dao.getOrderdAndPaginatedAndFiltered(StagiaireField.ARRIVAL, StagiaireField.LAST_NAME, recherche, 1, 10);
			List<Stagiaire> stagiaires = page.getContenu();
			assertEquals(2,stagiaires.size());
			assertEquals("2003-10-02", stagiaires.get(0).getArrival().toString());
			assertEquals("2020-10-12", stagiaires.get(1).getArrival().toString());
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@Test
	public void shouldReturnEverything() {
		try {
			String recherche = "";
			PageStagiaire page = dao.getOrderdAndPaginatedAndFiltered(StagiaireField.ARRIVAL, StagiaireField.LAST_NAME, recherche, 1, 10);
			List<Stagiaire> stagiaires = page.getContenu();
			assertEquals(3,stagiaires.size());
		} catch (DAOException e) {
			e.printStackTrace();
			fail();
		}
	}
	
	@BeforeEach
	public void setupDatabase() throws FileNotFoundException, DAOException, SQLException {
		try (Connection con = DataSource.getInstance().getConnection()) {
			/**
			 * Création des tables et de 3 enregistrements dans la table promotion : 
			 * id	|	name 
			 * _________________________
			 * 1	|	Février 2022 
			 * 2	|	Mars 2023 
			 * 3	|	Janvier 2021
			 * 
			 * Pour la table Stagiaire, on créé deux enregistrements : 
			 * id	|	first_name	|	last_name	
			 * _________________________________________
			 * 1	|	Adrienne	|	Mazet
			 * 2	|	Angèle		|	Cochet
			 * 3	|	Achille		|	Charbonnier
			 * 
			 */
			String path = "/home/oxyl/1-SCHEMA-StagiaireDAOTest.sql";
			RunScript.execute(con, new FileReader(path));
		}
		// Initialisation des annotations mockito
		MockitoAnnotations.openMocks(this);
		dao= Context.getInstance().getBean(StagiaireDAO.class);
	}
}
