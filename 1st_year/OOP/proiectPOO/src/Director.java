/**
 * Created by ovi on 06/06/2017.
 */
public class Director extends Profesor {

    private final Scoala scoala;

    public Director(String cnp, String nume, String prenume, String email, Clasa clasa, Scoala scoala) {
        super(cnp, nume, prenume, email, clasa);
        this.scoala = scoala;
    }

    public void adaugaElevi(Clasa clasa, Elev e) {
        clasa.getElevi().add(e);
    }

    public void stergeElevi(Clasa clasa, Elev e) {
        clasa.getElevi().remove(e);
    }
    public void afiseazaElevi(Clasa clasa){
        for(Elev i : clasa.getElevi()){
            System.out.println(i.nume + " " + i.prenume);
        }
    }

    public void adaugaProf(Profesor p) {
        scoala.getProfesori().add(p);
    }

    public void stergeProf(Profesor p) {
        scoala.getProfesori().remove(p);
    }
    public void afiseazaProfi(){
        for(Profesor i : scoala.getProfesori()){
            System.out.println(i.nume + " " + i.prenume);
        }
    }

    public void adaugaClasa(Clasa clasa) {
        scoala.getClase().add(clasa);
    }
    public void stergeClasa(Clasa clasa) {
        scoala.getClase().remove(clasa);
    }
    public void afiseazaClasa(Clasa clasa) {
        for(Clasa i : scoala.getClase()){
            System.out.println(clasa);
        }
    }



}
