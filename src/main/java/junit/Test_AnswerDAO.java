package junit;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;

import data.model.Answer;
import data.model.dao.AnswerDAO;

public class Test_AnswerDAO {
	AnswerDAO dao = new AnswerDAO();
	
	@Test
	void testGetOne() throws SQLException {
		try {
			assertEquals(dao.getOne(3), new Answer(4,"B", "cars carts", 0, 364));
		}
		catch(SQLException s) {
			fail(s.getMessage());
		}
	}
	
	@Test
	void testGetAll() throws SQLException {
		List<Answer> answers;
		try {
			answers = dao.getAll();		
			assertEquals(answers.get(0), new Answer(1,"A", "Oui", 1, 314));
			assertEquals(answers.get(18), new Answer(19,"A", "One line needs to be changed for this code to compile", 1, 366));
		}
		catch(SQLException s) {
			fail(s.getMessage());
		}
	}
}
