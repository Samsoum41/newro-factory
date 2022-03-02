INSERT INTO question (id,title,statement,chapter_id) VALUES
	 (314,'OCA - Chapter 2 - Dernière question','Sens tu grave à l\'aise avec ce chapitre ?',59),
	 (364,'OCA Final Exam - 1','<p>What is the output if this class is run with java Indexing cars carts? </p><p> </p><pre><code class="language-java">public class Indexing { 
	public static void main(String... books) { 
		StringBuilder sb = new StringBuilder(); 
		for (String book : books) 
			sb.insert(sb.indexOf("c"), book); 
		System.out.println(sb); 
	} 
}</code></pre>',5),
	 (365,'OCA Final Exam - 2','Fill in the blanks: The operators +=,__________ ,__________ ,__________ ,__________ , and ++ are listed in increasing or the same level of operator precedence. (Choose two.)',5),
	 (366,'OCA Final Exam - 3','<p>Which of the following are valid JavaBean signatures? (Choose three.)</p>',5),
	 (367,'OCA Final Exam - 4','<p>Which of the following are true? (Choose two.) </p><p> </p><pre><code class="language-java">20: int[] crossword [] = new int[10][20]; 
21: for (int i = 0; i &lt; crossword.length; i++) 
22: for (int j = 0; j &lt; crossword.length; j++) 
23: crossword[i][j] = ''x''; 
24: System.out.println(crossword.size());</code></pre>',5),
	 (368,'OCA Final Exam - 5','<p>Which of the following statements about java.lang.Error are most accurate? (Choose two.)</p>',5),
	 (369,'OCA Final Exam - 6','<p>Given a class that uses the following import statements, which class would be automatically accessible without using its full package name? (Choose three.) </p><p> </p><pre><code class="language-java">import forest.Bird; 
import jungle.tree.*; 
import savana.*;</code></pre>',5),
	 (370,'OCA Final Exam - 7','<p>How many of the following variables represent immutable objects? </p><p> </p><pre><code class="language-java">ArrayList l = new ArrayList(); 
String s = new String(); 
StringBuilder sb = new StringBuilder(); 
LocalDateTime t = LocalDateTime.now();</code></pre>',5),
	 (371,'OCA Final Exam - 8','<p>What is the output of the following? </p><p> </p><pre><code class="language-java">StringBuilder builder = new StringBuilder("Leaves growing"); 
do { builder.delete(0, 5); } 
while (builder.length() &gt; 5); 
System.out.println(builder);</code></pre>',5),
	 (372,'OCA Final Exam - 9','<p>What is the output of the following application? </p><p> </p><pre><code class="language-java">package reality; 
public class Equivalency { 
	public static void main(String[] edges) { 
		final String ceiling = "up"; 
		String floor = new String("up"); 
		final String wall = new String(floor); 
		System.out.print((ceiling==wall) +" "+(floor==wall) +" "+ceiling.equals(wall)); 
	} 
}</code></pre>',5);

