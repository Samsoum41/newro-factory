package mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.Mockito.when;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.sql.DataSource;

import org.h2.tools.RunScript;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;

import com.samsoum.newro.mapper.MapperException;
import com.samsoum.newro.mapper.StagiaireMapper;
import com.samsoum.newro.model.Promotion;
import com.samsoum.newro.model.Stagiaire;
import com.samsoum.newro.persistence.DAOException;

class StagiaireMapperTests {

	@Mock
	private ResultSet res;

	@Autowired
	private DataSource datasource;
	
	@Autowired
	private StagiaireMapper mapper;
	
	@BeforeEach
	public void setUp() throws FileNotFoundException, DAOException, SQLException {
		try (Connection con = datasource.getConnection()) {
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
			 * 
			 */
			String path = "/home/oxyl/1-SCHEMA-StagiaireDAOTest.sql";
			RunScript.execute(con, new FileReader(path));
		}
		// Initialisation des annotations mockito
		MockitoAnnotations.openMocks(this);
	}
	@Test
	void shouldReturnAdrienne() {
		Stagiaire realAdrienne = new Stagiaire(1, "Adrienne", "Mazet", LocalDate.of(1998, 9, 12), 
				LocalDate.of(2014, 5, 13), new Promotion(1, "Février 2022"));

		try {
			when(res.getInt("id")).thenReturn(1);
			when(res.getString("first_name")).thenReturn("Adrienne");
			when(res.getString("last_name")).thenReturn("Mazet");
			when(res.getDate("arrival")).thenReturn(Date.valueOf(LocalDate.of(1998, 9, 12)));
			when(res.getDate("formation_over")).thenReturn(Date.valueOf(LocalDate.of(2014, 5, 13)));
			when(res.getInt("promotion_id")).thenReturn(1);
			when(res.getString("name")).thenReturn("Février 2022");
			Stagiaire stagiaire = mapper.mapRow(res, 0);
			assertEquals(realAdrienne, stagiaire);
		} catch (MapperException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			fail();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			fail();
		}
	}

	@Test
	void shouldReturnAngele() {
		try {
			when(res.getString("first_name")).thenReturn("Angele");
			when(res.getString("last_name")).thenReturn("Cochet");
			when(res.getDate("arrival")).thenReturn(Date.valueOf(LocalDate.of(2003, 10, 2)));
			when(res.getDate("formation_over")).thenReturn(Date.valueOf(LocalDate.of(2008, 7, 23)));
			when(res.getInt("promotion_id")).thenReturn(2);
			when(res.getString("name")).thenReturn("Mars 2023");
			mapper.mapRow(res, 0);
		} catch (MapperException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			fail();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			fail();
		}
	}
}

