package com.samsoum.persistence.repositories.jpa;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.fail;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.h2.tools.RunScript;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import com.samsoum.newro.binding.persistence.dto.PromotionEntity;
import com.samsoum.newro.binding.persistence.dto.StagiaireEntity;
import com.samsoum.newro.persistence.DAOException;
import com.samsoum.newro.persistence.repositories.jpa.StagiaireRepository;
import com.samsoum.newro.persistence.util.Context;

class StagiaireRepositoryTests {
	/**
	 * Bean DataSource Hikari
	 */
	private StagiaireRepository dao;
	
	private DataSource datasource;

	@Test
	public void shouldAddStagiaireWithCorrectInput() {
		// Création d'un stagiaire
		StagiaireEntity hamzouille = new StagiaireEntity("Hamzouille", "LaPotatoe", LocalDate.of(2022, 2, 22), LocalDate.of(2022, 3, 23), new PromotionEntity(1, "Février 2022"));
		dao.save(hamzouille);
		// On vérifie (ça fait test d'intégration mais j'aime bien)
		StagiaireEntity stagiaire = dao.findByFirstName("Hamzouille").orElseGet(() -> fail());		
		assertEquals(hamzouille, stagiaire);
		assertEquals(4, dao.count());
	}
	
	@Test
	public void shouldReturnAdrienneMazeyFromId() throws DAOException {
		StagiaireEntity realAdrienne = new StagiaireEntity(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12),
				LocalDate.of(2014, 5, 13), new PromotionEntity(1, "Février 2022"));
		StagiaireEntity testAdrienne;
		testAdrienne = dao.findById(1).get();
		assertEquals(testAdrienne, realAdrienne);
	}

	@Test
	public void shouldReturnAdrienneMazeyFromNames() {
		StagiaireEntity realAdrienne = new StagiaireEntity(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12),
				LocalDate.of(2014, 5, 13), new PromotionEntity(1, "Février 2022"));
		StagiaireEntity testAdrienne;
		testAdrienne = dao.findByFirstNameContainingOrLastNameContaining("Adrienne").get();
		assertEquals(testAdrienne, realAdrienne);
	}

	@Transactional
	@Test
	public void shouldDeleteStagiaireThatExists() {
		dao.deleteById(1);
		dao.deleteById(2);
		long count = dao.count();
		assertEquals(1, count);
	}

	@Test
	public void shouldNotDeleteStagiaireThatDoesNotExist() {
		// Il n'y a aucun stagiaire d'id 1000
		assertThrows(EmptyResultDataAccessException.class, () -> dao.deleteById(1000));
	}

	@Test
	public void shouldReturnStagiairesSearchedAndOrderedByFirstNamePage() {
		String searchedString = "le";
		Pageable p = PageRequest.of(0, 10, Sort.by("firstName").ascending());
		Page<StagiaireEntity> page = dao.findByFirstNameContainingOrLastNameContaining(searchedString, p);
		System.out.println(page.getContent());
		assertEquals("Achille", page.getContent().get(0).getFirstName());
		assertEquals("Angèle", page.getContent().get(1).getFirstName());
		assertEquals(2, page.getNumberOfElements());
	}

	@Test
	public void shouldReturnStagiairesOrderedByLastNamePage() {
		Pageable p = PageRequest.of(0, 10, Sort.by("lastName"));
		Page<StagiaireEntity> page = dao.findByFirstNameContainingOrLastNameContaining("", p);
		List<StagiaireEntity> stagiaires = page.toList();
		assertEquals("Charbonnier", stagiaires.get(0).getLastName());
		assertEquals("Cochet", stagiaires.get(1).getLastName());
		assertEquals("Mazet", stagiaires.get(2).getLastName());
	}

	@Test
	public void shouldReturnStagiairesOrderedByArrivalPage() {
		Pageable p = PageRequest.of(0, 10, Sort.by("arrival"));
		Page<StagiaireEntity> page = dao.findByFirstNameContainingOrLastNameContaining("", p);
		List<StagiaireEntity> stagiaires = page.toList();
		assertEquals("Adrienne", stagiaires.get(0).getFirstName());
		assertEquals("Angèle", stagiaires.get(1).getFirstName());
		assertEquals("Achille", stagiaires.get(2).getFirstName());
	}

//	@Test
//	public void shouldReturnStagiairesOrderedByFormationOverPage() {
//		Page<StagiaireEntity> page = dao.get(StagiaireField.FORMATION_OVER, 1, 10);
//		List<Stagiaire> stagiaires = page.getContenu();
//		assertEquals("Angèle", stagiaires.get(0).getFirst_name());
//		assertEquals("Adrienne", stagiaires.get(1).getFirst_name());
//		assertEquals("Achille", stagiaires.get(2).getFirst_name());
//	}
//
//	@Test
//	public void shouldReturnFilteredByFirstNameAndOrderedByLastNamePage() {
//		String recherche = "ien";
//		Page<StagiaireEntity> page = dao.get(StagiaireField.LAST_NAME, StagiaireField.FIRST_NAME, recherche, 1, 10);
//		List<Stagiaire> stagiaires = page.getContenu();
//		assertEquals(1, stagiaires.size());
//		assertEquals("Adrienne", stagiaires.get(0).getFirst_name());
//	}
//
//	@Test
//	public void shouldReturnFilteredByLastNameAndOrderedByArrivalPage() {
//		// Dans H2 c'est sensible à la casse, si je recherche 'c' et 'C' c'est pas
//		// pareil
//		String recherche = "C";
//		Page<StagiaireEntity> page = dao.get(StagiaireField.ARRIVAL, StagiaireField.LAST_NAME, recherche, 1, 10);
//		List<Stagiaire> stagiaires = page.getContenu();
//		assertEquals(2, stagiaires.size());
//		assertEquals("2003-10-02", stagiaires.get(0).getArrival().toString());
//		assertEquals("2020-10-12", stagiaires.get(1).getArrival().toString());
//	}
//
//	@Test
//	public void shouldReturnEverything() {
//		String recherche = "";
//		Page<StagiaireEntity> page = dao.get(StagiaireField.ARRIVAL, StagiaireField.LAST_NAME, recherche, 1, 10);
//		List<Stagiaire> stagiaires = page.getContenu();
//		assertEquals(3, stagiaires.size());
//	}
//
	@Test
	public void shouldUpdateAdrienneData() {
		// J'ai changé le nom, le prénom et la promotion.
		StagiaireEntity modifiedAdrienne = new StagiaireEntity(1, "Adrien", "Maz", LocalDate.of(1998, 9, 12),
				LocalDate.of(2014, 5, 13), new PromotionEntity(3, "Janvier 2021"));
		dao.save(modifiedAdrienne);
		StagiaireEntity result = dao.findById(1).get();
		assertEquals(result, modifiedAdrienne);
		assertEquals(3, dao.count());
	}

	@Test
	public void shouldCountThreeStagiaires() {
		long result = dao.count();
		assertEquals(3, result);
	}

	@BeforeEach
	public void setupDatabase() throws FileNotFoundException, DAOException, SQLException {
		dao = Context.getInstance().getBean(StagiaireRepository.class);
		datasource = Context.getInstance().getBean(DataSource.class);
		try (Connection con = datasource.getConnection()) {
			/**
			 * Création des tables et de 3 enregistrements dans la table promotion : 
			 *  id 	| name 
			 *  1 	| Février 2022 
			 *  2 	| Mars 2023 
			 *  3 	| Janvier 2021
			 * 
			 * Pour la table Stagiaire, on créé deux enregistrements : 
			 *  id 	| first_name	|	last_name 
			 *   1 	| Adrienne 		| Mazet 
			 *   2 	| Angèle 		| Cochet 
			 *   3 	| Achille 		| Charbonnier
			 * 
			 */
			String path = "/home/oxyl/1-SCHEMA-StagiaireDAOTest.sql";
			RunScript.execute(con, new FileReader(path));
		}
		// Initialisation des annotations mockito
		MockitoAnnotations.openMocks(this);
	}
}
