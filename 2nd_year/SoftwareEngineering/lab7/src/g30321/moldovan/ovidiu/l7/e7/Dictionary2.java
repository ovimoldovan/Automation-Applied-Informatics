package g30321.moldovan.ovidiu.l7.e7;



import java.util.*;
import java.io.*;
 
public class Dictionary2 {
 
         HashMap dct = new HashMap();
 
         public void addWord(Word c, String definition) {
 
              if(dct.containsKey(c))
                    System.out.println("Modify existing word!");            
              else              
                   System.out.println("Add new word.");              
              dct.put(c, definition);        
         }
 
         public String searchWord(Word c) {
        	 System.out.println("Search "+c);
        	 System.out.println(dct.containsKey(c));
            return (String)dct.get(c);
         }
 
         public void displayDictionary() {
            System.out.println(dct);
         }
 
 
         public static void main(String args[]) throws Exception {
            Dictionary2 dict = new Dictionary2();
            char response;
            String line, explain;
            
BufferedReader fluxIn = new BufferedReader(new InputStreamReader(System.in));
 
            do {
               System.out.println("Menu");
               System.out.println("a - Add word");
               System.out.println("c – Search word");
               System.out.println("l - List dictionary");
               System.out.println("e - End");
 
               line = fluxIn.readLine();
               response = line.charAt(0);
 
               switch(response) {
                  case 'a': case 'A':
                     System.out.println("Introduce the word:");
                     line = fluxIn.readLine();
                     if( line.length()>1) {
                        System.out.println("Introduce definition:");
                        explain = fluxIn.readLine();
                        dict.addWord(new Word(line), explain);
                     }
                  break;
                  case 'c': case 'C':
                     System.out.println("Search word:");
                     line = fluxIn.readLine();
                     if( line.length()>1) {
                    	Word x = new Word(line);
                    	explain = dict.searchWord(x);
                        if (explain == null)
                           System.out.println("The word is not found!");
                        else
                           System.out.println("Definition:"+explain);
                     }
                  break;
                  case 'l': case 'L':
                     System.out.println("Display:");
                     dict.displayDictionary();
                  break;
                }
            } while(response!='e' && response!='E');
            System.out.println("Program Ended.");
         }
      }
 
class Word{
      String c;
      public Word(String c) {
            this.c = c;
      }
       //Equals makes the same word to be added only once
      //Hashcode affects the order in which the elements are added
      @Override
      public boolean equals(Object obj) {
    	  	if(!(obj instanceof Word))
    	  		return false;
    	  	Word x = (Word)obj;
    	  	return c.equals(x.c);
      }
       public int hashCode() {
            return (int)(c.length()*1000);
      }
      
       public String toString() {
            return c;
      }    
}