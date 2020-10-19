import java.awt.*;

import static java.awt.Color.blue;

/**
 * Created by ovi on 01/04/2017.
 */
public class Autovehicul {



    private class CutieViteze{

        public static final int MAX_VITEZE = 6;
        private int nrViteza;



        public void setNrViteza(int nrViteza) {
            if(nrViteza<MAX_VITEZE && nrViteza > 1)
                this.nrViteza = nrViteza;
        }

        public int getNrViteza() {
            return nrViteza;
        }

        public void gearUp(){
            this.nrViteza++;
        }
    }


    private class Rezervor{

        int capacitate;

        Rezervor(int x){
            capacitate = x;
        }

        public int getCapacitate() {
            return capacitate;
        }

        public void setCapacitate(int capacitate) {
            this.capacitate = capacitate;
        }
    }



    String marca;
    Color culoare;
    int km;
    static int viteza;
    int treapta;
    int litri;
    int v_max;


    Autovehicul(String marca, int treapta, int litri){
        this.marca = marca;
        CutieViteze c = new CutieViteze();
        c.setNrViteza(treapta);
        Rezervor r = new Rezervor(litri);


        this.culoare = blue;

        System.out.println(this.marca + " " + c.getNrViteza() + " " + r.capacitate + " " + this.culoare);


    }








    void accelereaza(){
        Autovehicul x = new Autovehicul(marca, treapta, litri);
        CutieViteze c = new CutieViteze();
        c.setNrViteza(treapta + 1);
        Rezervor r = new Rezervor(litri);

        c.setNrViteza(treapta+1);

        //System.out.println(x.marca + " " + c.getNrViteza() + " " + r.capacitate );


    }

    static void decelereaza(){

    }

    static void oprire(){

    }
}
