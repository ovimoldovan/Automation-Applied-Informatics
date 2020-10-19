package g30321.moldovan.ovidiu.l7.e6;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.TreeMap;

public class Dictionary {
	TreeMap dct = new TreeMap(); 
	public Dictionary() { } 
	public void addWord(String word, String definition) { 
		if(dct.containsKey(word)){ 
			System.out.println("Modify existing word!"); 
			} 
		else { 
			System.out.println("Add new word."); 
			} 
		dct.put(word, definition); 
		} 
	public String searchWord(String word) { 
		return (String)dct.get(word); 
		} 
	public void displayDictionary() { 
		System.out.println(this); 
		}
	
	public void deleteWord(String word) {
		if(dct.containsKey(word)) {
			dct.remove(word);
		}
		else System.out.println("Word doesn't exist");
	}
	
	public static void main(String args[]) throws Exception { 
		Dictionary dict = new Dictionary(); 
		char response; String line, explain; 
		BufferedReader fluxIn = new BufferedReader(new InputStreamReader(System.in));
		do { System.out.println("Menu"); 
		System.out.println("a - Add word"); 
		System.out.println("c - Search word"); 
		System.out.println("l - List dictionary"); 
		System.out.println("e - Get");
		System.out.println("d - Delete"); 
		line = fluxIn.readLine(); 
		response = line.charAt(0);
		switch(response) { 
		case 'a': 
			case 'A': 
				System.out.println("Enter the word:"); 
				line = fluxIn.readLine(); 
				if( line.length()>1) { 
					System.out.println("Enter definition:"); 
					explain = fluxIn.readLine(); 
					dict.addWord(line, explain); 
					} 
				break; 
				case 'c': case 'C': 
					System.out.println("Search word:"); 
					line = fluxIn.readLine(); 
					if( line.length()>1) {
						explain = dict.searchWord(line); 
						if (explain == null) 
							System.out.println("dosn’t exist"); 
						else System.out.println("Explanation:"+explain); 
						} break; 
						case 'l': case 'L': 
							System.out.println("Display:"); 
							dict.displayDictionary(); 
							break; 
		case 'd': case 'D':
			System.out.println("Delete word:");
			line = fluxIn.readLine();
			dict.deleteWord(line);
			break;
		}
		} while(response!='e' && response!='E'); 
		System.out.println("Program ended."); 
		} 
				
	
	}

