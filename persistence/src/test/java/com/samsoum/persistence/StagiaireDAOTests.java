package com.samsoum.persistence;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.h2.tools.RunScript;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.samsoum.newro.binding.util.Context;
import com.samsoum.newro.mapper.MapperException;
import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.StagiaireDao;
import com.samsoum.newro.persistence.StagiaireField;
import com.samsoum.newro.ui.PageStagiaire;

class StagiaireDaoTests {
	@Mock
	private StagiaireMapper mapper;

	/**
	 * Bean DataSource Hikari
	 */
	private DataSource datasource;
	private StagiaireDao dao;

	@Test
	public void addStagiaireWithCorrectInputShouldWork() throws MapperException, SQLException {
		// Création d'un stagiaire
		String first_name = "Hamzouille";
		String last_name = "LaPotatoe";
		Promotion promotion = new Promotion(1, "Février 2022");
		LocalDate arrival = LocalDate.of(2022, 2, 22);
		LocalDate departure = LocalDate.of(2022, 3, 23);
		Stagiaire stagiaire = new Stagiaire(first_name, last_name, arrival, departure, promotion);
		// Mock du mapper
		String query = """
				INSERT INTO stagiaire(first_name, last_name, arrival, formation_over, promotion_id)
				VALUES('Hamzouille', 'LaPotatoe', '2022-02-22','2022-03-23',1);
				""";
		PreparedStatement statement = datasource.getConnection().prepareStatement(query);
		when(mapper.toStatement(any(Stagiaire.class), any(PreparedStatement.class))).thenReturn(statement);
		// Fonction à tester :
		dao.add(stagiaire);
		// Si on est là, c'est que c'eLes getters sont bonsst bon
	}

	@Test
	public void shouldReturnAdrienneMazeyFromId() throws DAOException {
		Stagiaire realAdrienne = new Stagiaire(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12),
				LocalDate.of(2014, 5, 13), new Promotion(1, "Février 2022"));
		Stagiaire testAdrienne;
		testAdrienne = dao.getById(1).get();
		assertEquals(testAdrienne, realAdrienne);
	}

	@Test
	public void shouldReturnAdrienneMazeyFromNames() {
		Stagiaire realAdrienne = new Stagiaire(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12),
				LocalDate.of(2014, 5, 13), new Promotion(1, "Février 2022"));
		Stagiaire testAdrienne;
		System.out.println();
		testAdrienne = dao.getByNames("Adrienne", "Mazet").get();
		assertEquals(testAdrienne, realAdrienne);
	}

	@Test
	public void shouldDeleteStagiaireThatExists() {
		int deletAdrienneResult;
		int deleteAngeleResult;
		deletAdrienneResult = dao.delete(1);
		deleteAngeleResult = dao.delete(2);
		assertTrue(deletAdrienneResult > 0);
		assertTrue(deleteAngeleResult > 0);
	}

	@Test
	public void shouldNotDeleteStagiaireThatDoesNotExist() {
		// Il n'y a aucun stagiaire d'id 1000
		int i = dao.delete(1000);
		assertEquals(0, i);
	}

	@Test
	public void shouldReturnStagiairesOrderedByFirstNamePage() {
		PageStagiaire page = dao.get(StagiaireField.FIRST_NAME, 1, 10);
		List<Stagiaire> stagiaires = page.getContenu();
		assertEquals("Achille", stagiaires.get(0).getFirst_name());
		assertEquals("Adrienne", stagiaires.get(1).getFirst_name());
		assertEquals("Angèle", stagiaires.get(2).getFirst_name());
	}

	@Test
	public void shouldReturnStagiairesOrderedByLastNamePage() {
		PageStagiaire page = dao.get(StagiaireField.LAST_NAME, 1, 10);
		List<Stagiaire> stagiaires = page.getContenu();
		assertEquals("Charbonnier", stagiaires.get(0).getLast_name());
		assertEquals("Cochet", stagiaires.get(1).getLast_name());
		assertEquals("Mazet", stagiaires.get(2).getLast_name());
	}

	@Test
	public void shouldReturnStagiairesOrderedByArrivalPage() {
		PageStagiaire page = dao.get(StagiaireField.ARRIVAL, 1, 10);
		List<Stagiaire> stagiaires = page.getContenu();
		assertEquals("Adrienne", stagiaires.get(0).getFirst_name());
		assertEquals("Angèle", stagiaires.get(1).getFirst_name());
		assertEquals("Achille", stagiaires.get(2).getFirst_name());
	}

	@Test
	public void shouldReturnStagiairesOrderedByFormationOverPage() {
		PageStagiaire page = dao.get(StagiaireField.FORMATION_OVER, 1, 10);
		List<Stagiaire> stagiaires = page.getContenu();
		assertEquals("Angèle", stagiaires.get(0).getFirst_name());
		assertEquals("Adrienne", stagiaires.get(1).getFirst_name());
		assertEquals("Achille", stagiaires.get(2).getFirst_name());
	}

	@Test
	public void shouldReturnFilteredByFirstNameAndOrderedByLastNamePage() {
		String recherche = "ien";
		PageStagiaire page = dao.get(StagiaireField.LAST_NAME, StagiaireField.FIRST_NAME, recherche, 1, 10);
		List<Stagiaire> stagiaires = page.getContenu();
		assertEquals(1, stagiaires.size());
		assertEquals("Adrienne", stagiaires.get(0).getFirst_name());
	}

	@Test
	public void shouldReturnFilteredByLastNameAndOrderedByArrivalPage() {
		// Dans H2 c'est sensible à la casse, si je recherche 'c' et 'C' c'est pas
		// pareil
		String recherche = "C";
		PageStagiaire page = dao.get(StagiaireField.ARRIVAL, StagiaireField.LAST_NAME, recherche, 1, 10);
		List<Stagiaire> stagiaires = page.getContenu();
		assertEquals(2, stagiaires.size());
		assertEquals("2003-10-02", stagiaires.get(0).getArrival().toString());
		assertEquals("2020-10-12", stagiaires.get(1).getArrival().toString());
	}

	@Test
	public void shouldReturnEverything() {
		String recherche = "";
		PageStagiaire page = dao.get(StagiaireField.ARRIVAL, StagiaireField.LAST_NAME, recherche, 1, 10);
		List<Stagiaire> stagiaires = page.getContenu();
		assertEquals(3, stagiaires.size());
	}

	@Test
	public void shouldUpdateAdrienneData() {
		// J'ai changé le nom, le prénom et la promotion.
		Stagiaire modifiedAdrienne = new Stagiaire(1, "Adrien", "Maz", LocalDate.of(1998, 9, 12),
				LocalDate.of(2014, 5, 13), new Promotion(3, "Janvier 2021"));
		int i = dao.update(modifiedAdrienne);
		Stagiaire result = dao.getById(1).get();
		assertEquals(result, modifiedAdrienne);
		assertTrue(i == 1);
	}

	@Test
	public void shouldCountThreeStagiaires() {
		int result = dao.count();
		assertEquals(3, result);
	}

	@BeforeEach
	public void setupDatabase() throws FileNotFoundException, DAOException, SQLException {
		dao = Context.getInstance().getBean(StagiaireDao.class);
		datasource = Context.getInstance().getBean(DataSource.class);
		try (Connection con = datasource.getConnection()) {
			/**
			 * Création des tables et de 3 enregistrements dans la table promotion : id |
			 * name _________________________ 1 | Février 2022 2 | Mars 2023 3 | Janvier
			 * 2021
			 * 
			 * Pour la table Stagiaire, on créé deux enregistrements : id | first_name |
			 * last_name _________________________________________ 1 | Adrienne | Mazet 2 |
			 * Angèle | Cochet 3 | Achille | Charbonnier
			 * 
			 */
			String path = "/home/oxyl/1-SCHEMA-StagiaireDaoTest.sql";
			RunScript.execute(con, new FileReader(path));
		}
		// Initialisation des annotations mockito
		MockitoAnnotations.openMocks(this);
	}
}
