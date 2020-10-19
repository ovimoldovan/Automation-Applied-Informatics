import java.util.*;

/**
 * Created by ovi on 06/06/2017.
 */
public class Scoala {

    private final String nume;
    private final List<Elev> elevi;
    private final List<Clasa> clase;
    private final List<Profesor> profesori;
    private final Map<Integer, Clasa> idToClass;
    private final Map<Clasa, Integer> classToId;

    public Scoala(String nume, List<Elev> elevi, List<Clasa> clase, List<Profesor> profesori) {
        assert(elevi.size() >= 60): "Trebuie minim 60 elevi";
        assert(clase.size() >= 4 && clase.size() <= 20): "Trebuie intre 4 si 20 de clase";
        assert(profesori.size() >= 1): "Trebuie minim un profesor";

        this.nume = nume;
        this.elevi = elevi;
        this.clase = clase;
        this.profesori = profesori;
        this.idToClass = new HashMap<>();
        this.classToId = new HashMap<>();
    }

    public List<Profesor> getProfesori() {
        return profesori;
    }

    public List<Clasa> getClase() {
        return clase;
    }

    public List<Elev> getElevi() {
        return elevi;
    }

    public Map<Integer, Clasa> getIdToClass() {
        return idToClass;
    }

    public Map<Clasa, Integer> getClassToId() {
        return classToId;
    }

    public void addMapping(Integer classId, Clasa clasa) {
        idToClass.put(classId, clasa);
        classToId.put(clasa, classId);
    }

    public String getNume() {
        return nume;
    }
}
