import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class ex2 {
	static Integer[][] add() throws IOException{
		Integer [][] a = new Integer[3][3];
		File f = new File("src/mat.txt");
		//BufferedReader br = new BufferedReader(new FileReader(f));
		Scanner s = new Scanner(f);
		for(int i = 0; i < 3; i++)
			for(int j = 0; j < 3; j++){
				a[i][j] = s.nextInt();
			}
		return a;
	}
	
	static void printM(Integer[][] x){
		for(int i = 0; i < 3; i++){
			for(int j = 0; j < 3; j++){
				System.out.print(x[i][j] + " " );
			}
			System.out.print("\n");
		}
	}
	public static void main(String[] args) throws IOException{
		Integer[][] a = new Integer[3][3];
		Integer[][] b = new Integer[3][3];
		a = add();
		b = add();
		printM(a);
		printM(b);
	}
}
