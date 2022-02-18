/**
 * 
 */
package junit.ui;

import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import org.junit.jupiter.api.Test;

import ui.Utilitaire;

/**
 * @author Samsoum41
 *
 */
class UtilitaireTest {

	@Test
	void test_needInt() {
		InputStream stdin = System.in;	
		
		scan_and_input_line("a", "b", "c", "3");
		int result1 = Utilitaire.needInt("Une entrée est incorrecte");
		assertEquals( result1 , 3);

		scan_and_input_line("b", "c", "2");
		int result2 = Utilitaire.needInt("Une entrée est incorrecte");
		assertEquals( result2 , 2);
		
		scan_and_input_line("a", "b", "c");
		int result3 = Utilitaire.needInt("Une entrée est incorrecte");
		System.out.println(result3);
		System.setIn(stdin);
		assertNull( result3 );
	}
	private void scan_and_input_line(String... args) {
		StringBuilder inputs = new StringBuilder();
		for (String input : args) {
			inputs.append(input + "\n");
		}
		ByteArrayInputStream entries = new ByteArrayInputStream(inputs.toString().getBytes());
		System.setIn(entries);
	}
}
