/** WordCounter, counts how many times a certain word 
 * appears in the documents it has seen
 * 
 * @author Amber Ilyas
 *
 */

public class WordCounter {

	private String f;
	
	private int number;
	private int wordsSpam;
	private int wordsNoSpam;
	private int focusSpam;
	private int focusNoSpam;
	
	
	/**
	 *  This method takes in a String (focusWord), which is the word 
	 *  that is be counted by the current WordCounter object
	 * @param focusWord
	 */
	
	public WordCounter(String focusWord){
		f = focusWord;
	}
	
	
	/**
	 * This method returns the focus word when it is invoked
	 * @return focus word
	 */
	
	public String getFocusWord() {
		return f;
	}
	
	/**
	 * This method extracts the following statistics from the String:
	 * 		Whether the document in question has true classiﬁcation, spam or no spam.
	 * 		How many times the focusWord appears in the document.
	 * 		The total number of words that appear in the document
	 * @param document
	 */
	
	public void addSample(String document) {
		String [] array = document.split("");
		
			number = Integer.parseInt(array[0]);

			if (number == 0) {
				wordsNoSpam = wordsNoSpam + array.length - 1;
				
				for (String word : array) {
					if(word.equals(f)) {
						focusNoSpam = focusNoSpam + 1;
					}
				}
			}
			
			
			else {
				wordsSpam = wordsSpam + array.length - 1;
				
				for (String word : array) {
					if(word.contentEquals(f)) {
						focusSpam = focusSpam + 1;
					}
				}
			}
			
	}
	
	
	
	/**
	 * This method checks if a WordCounter has seen enough 
	 * information to consider it properly trained.
	 * @return true if it is properly trained
	 */
	
	public boolean isCounterTrained() {
		if (focusSpam + focusNoSpam >= 1 && wordsSpam >= 1 && wordsNoSpam >=1) {
			return true;
		}	
			// A WordCounter is trained if and only if it has seen its focusWord 
			// in at least one document, it has seen at least one spam document 
			// and it has seen at least one no spam document. 		
		
		else {
			return false;
		}
	}
	
	
	/**
	 * This method estimates the probability that a random word 
	 * from a NoSpam document is the focusWord
	 * @return probability
	 */
	
	public double getConditionalNoSpam() {
		if (isCounterTrained() == false) {
			throw new IllegalStateException();
		}
		
		double ratio = focusNoSpam/wordsNoSpam;
		return ratio;
	}
	
	/**
	 * This method estimates the probability that a random word from 
	 * a Spam document is the focusWord
	 * @return probability
	 */
	
	public double getConditionalSpam() {
		if (isCounterTrained() == false) {
			throw new IllegalStateException();
		}
		
		double ratio = focusSpam/wordsSpam; 
		return ratio;
	}
}
