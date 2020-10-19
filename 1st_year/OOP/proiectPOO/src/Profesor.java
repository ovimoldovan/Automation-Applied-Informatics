import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ovi on 06/06/2017.
 */
public class Profesor extends Persoana {

    protected final Clasa clasa;

    public Profesor(String cnp, String nume, String prenume, String email, Clasa clasa) {
        super(cnp, nume, prenume, email);
        this.clasa = clasa;
    }

    public Catalog creare(Clasa clasa) {
        return new Catalog(new HashMap<>(), clasa);
    }

    public void adaugaNota(Evaluare evaluare, Elev elev, Catalog catalog) {
        if(!catalog.getNote().keySet().contains(elev.getId())) {
            catalog.getNote().put(elev.getId(), new ArrayList<>());
        }
        catalog.getNote().get(elev.getId()).add(evaluare);
    }

    public void afiseazaNote(Catalog catalog){
        Map<Integer, List<Evaluare>> note = catalog.getNote();
        for(Integer i : note.keySet()) {
            System.out.println(i + "\n");
            for(Evaluare e : note.get(i)) {
                System.out.println(e.getIdMaterie() + " " + e.getNota() + "\n");
            }
        }
    }

    public void adaugaElevi(Elev e) {
        clasa.getElevi().add(e);
    }

    public void stergeElevi(Elev e) {
        clasa.getElevi().remove(e);
    }
    public void afiseazaElevi(){
        System.out.println(clasa.getElevi().size());
        for(Elev i : clasa.getElevi()){
            System.out.println(i.nume + " " + i.prenume);
        }
    }

}
