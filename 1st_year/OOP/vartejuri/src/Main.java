import java.util.Scanner;

/**
 * Created by ovi on 10/07/2017.
 */
public class Main {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        //System.out.println("X and Y");
        //int x = s.nextInt();
        //int y = s.nextInt();
        int x = 12; int y = 75;
        Harta harta = new Harta(x,y);
        //harta.createMap(x,y);
        harta.showMap();

    }
}
