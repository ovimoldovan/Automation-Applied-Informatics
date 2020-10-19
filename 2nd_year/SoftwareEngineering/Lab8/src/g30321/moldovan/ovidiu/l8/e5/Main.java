package g30321.moldovan.ovidiu.l8.e5;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class Main {

	public static void main(String[] args) throws IOException {
		BufferedReader fluxIn = new BufferedReader(new InputStreamReader(System.in));
		PrintWriter out1 = new PrintWriter(new BufferedWriter(new FileWriter("data.out")));
		String s;
		try {
			while(!(s=fluxIn.readLine()).equals("exit")){
				System.out.println(s);
				out1.println(s);
			}
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		fluxIn.close();
		out1.close();
	}

}
