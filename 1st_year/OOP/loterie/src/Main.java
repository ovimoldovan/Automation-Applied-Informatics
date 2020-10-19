/**
 * Created by ovi on 18/03/2017.
 */
public class Main {
    public static void main( String[] args){
        System.out.println("Citire numere.");
        Bilet bilet = new Bilet();
        Bilet.citesteNumere();
        Bilet.afiseazaNumere();
        Extragere ex = new Extragere(6,49);
        ex.make();
        ex.verify();
    }
}
