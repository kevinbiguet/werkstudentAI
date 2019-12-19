import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;


/**
 * 
 * @author Amber Ilyas
 *
 */

public class NaiveBayes {

	
	private int docNoSpam;
	private int docSpam;
	private int number;
	
	private double spamScore;
	private double noSpamScore;
	
	private WordCounter[] arrayWordCounter;
	
	 
	public NaiveBayes(String[] focusWords) {
		for(int i = 0; i < arrayWordCounter.length; i++){
			arrayWordCounter[i] = new WordCounter(focusWords[i]);
		}	
	}
	  
	 
	 
	public void addSample(String document) {
		String [] array = document.split("");
			
		number = Integer.parseInt(array[0]);

		if (number == 0) {
			docNoSpam = docNoSpam + 1;
		}
			
		else {
			docSpam = docSpam + 1;	
		}					
	}
	 
	 
	/**
	 * 
	 * @param unclassifiedDocument
	 * @return
	 */
	 
	public boolean classify(String unclassifiedDocument) {
		spamScore = docSpam/(docSpam + docNoSpam);
		noSpamScore = docNoSpam/(docSpam + docNoSpam);
		
		String[] unclassDoc = unclassifiedDocument.split("");
		
		for (String word : unclassDoc) {
			for(int i = 0; i < arrayWordCounter.length; i++){
				if(word.equals(arrayWordCounter[i].getFocusWord())) {
					spamScore = spamScore* arrayWordCounter[i].getConditionalSpam();
					noSpamScore = noSpamScore* arrayWordCounter[i].getConditionalNoSpam();
				}
			}
		}
		
		
		if (noSpamScore < spamScore) {
			return true;
		}
		
		
		else {
			return false;
		}
				 
	}
	 
	
	 
	/**
	 * 
	 * @param trainingFile
	 * @throws IOException
	 */
	 
	public void trainClassifier(File trainingFile) throws IOException {
		try (Scanner s = new Scanner(trainingFile)) { 
			while (s.hasNext()) { 
				String line = s.nextLine();  
			} 
		} 
	}
		
	 
	 
	/**
	 * 
	 * @param input
	 * @param output
	 * @throws IOException
	 */
	 
	public void classifyFile(File input, File output) throws IOException {
		try ( 
			BufferedReader br = new BufferedReader(new FileReader(input)); 
			PrintWriter pw = new PrintWriter(output)) { 
			
			String line = br.readLine(); 
			
			while (line != null) { 
				for(int i = 0; i < arrayWordCounter.length; i++){
					if (line.contains(arrayWordCounter[i].getFocusWord())) { 
						pw.println("1"); 
					}
					
					else {
						pw.println("0");
					}
				}
				
				line = br.readLine(); 
			} 
			
			pw.flush(); 
		}
	}
	 
	 
	/**
	 * 
	 * @param testdata
	 * @return
	 * @throws IOException
	 */
	 
	public ConfusionMatrix computeAccuracy(File testdata) throws IOException {
		return null;
		 
	}
}
