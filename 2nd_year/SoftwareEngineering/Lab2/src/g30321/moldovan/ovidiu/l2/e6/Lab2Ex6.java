package g30321.moldovan.ovidiu.l2.e6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Lab2Ex6 {
	public static void main(String[] args) throws IOException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String s = br.readLine();
		int words = 1, i;
		//System.out.println(s); just debugging
		for(i = 0; i<s.length(); i++){
			if(s.charAt(i)==' ') {
				words++;
				if(s.charAt(i+1) == ' ') i++;
			}
		
		}
		//words++;
		System.out.println("words: " + words + "chars: " + i);
		
	}
	
}
