/**
 * Created by ovi on 20/05/2017.
 */
public class scoala {
    public static String nume;

    public static void setNume(String nume) {
        scoala.nume = nume;
    }


    public static class clasa{
        int idClasa;
        int an;
        char lit;
        public int nrElevi = 0;


        clasa(int a, char b, int c){
            this.idClasa = c;
            this.an = a;
            this.lit = b;
        }

        elev[] elevi = new elev[30];

        void adaugaElevi(String x, String y, String z, int ide){

            elevi[nrElevi] = new elev(x,y,z,ide);
        }


    }

}
