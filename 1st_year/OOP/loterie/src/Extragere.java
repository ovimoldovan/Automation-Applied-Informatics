import java.util.Random;

/**
 * Created by ovi on 18/03/2017.
 */


public class Extragere {
    static int min = 0;
    static int max = 0;
    static int k = 0;
    static int[] castig = new int[6];


    public Extragere(int n, int m){
        min = n;
        max = m;
    }

    public static void make(){
        Random x = new Random();
        System.out.println("Numerele castigatoare sunt: ");
        for(int i=0;i<6;i++) {
            int numar = 1 + x.nextInt(max - 1);
            for(int j=0;j<i;j++) if(numar == castig[i]) numar = 1 + x.nextInt(max - 1);
            System.out.println(numar + " ");
            castig[i] = numar;
        }
    }

    public static void verify(){
        for(int i=0;i<min;i++)
            for(int j=0;j<min;j++) {
                if (Bilet.numere[i] == castig[j]) {
                    System.out.println("Numar castigator: " + castig[j]);
                    k++;
                }
            }
        System.out.println(k + " numere castigatoare.");
    }






}
