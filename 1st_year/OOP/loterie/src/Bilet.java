import java.util.Scanner;

/**
 * Created by ovi on 18/03/2017.
 */
public class Bilet {

    public static Scanner sc = new Scanner(System.in);


    static int[] numere = new int[6];



    public static void citesteNumere(){

        for(int i=0;i<6;i++){
            System.out.println("Numarul " + (i+1) );
            numere[i] = sc.nextInt();
        }
    }

    public static void afiseazaNumere(){
        for(int i=0;i<6;i++){
            System.out.println(numere[i]+ " ");
        }
    }
}
