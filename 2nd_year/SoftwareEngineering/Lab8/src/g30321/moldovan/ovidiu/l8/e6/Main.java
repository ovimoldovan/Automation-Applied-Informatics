package g30321.moldovan.ovidiu.l8.e6;

import java.io.*;

public class Main {

	public static void main(String[] args) throws IOException {
		String fileName, S;
		BufferedReader s = new BufferedReader(new InputStreamReader(System.in));
		fileName = s.readLine();
		DataInputStream inFile = new DataInputStream(new BufferedInputStream(new FileInputStream(fileName)));
		
		try{while((S = inFile.readLine())!=null){
			
			System.out.println(S);
		}
		}
		catch(EOFException e){
			System.err.println("end of file");
		}
		
		//example test: fileName = IODemo.out

	}

}
