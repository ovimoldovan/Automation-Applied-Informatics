import java.util.List;
import java.util.Set;

/**
 * Created by ovi on 06/06/2017.
 */
public class Clasa {

    private final int id;
    private final String numar;
    private final char litera;
    Catalog catalog;
    private final List<Materie> materii;
    private final List<Elev> elevi;

    public Clasa(int id, String numar, char litera, Catalog catalog, List<Materie> materii, List<Elev> elevi) {
        this.id = id;
        assert(elevi.size() <= 30 && elevi.size() >= 15): "Numarul de elevi trebuie cuprins intre 15 si 30";

        this.numar = numar;
        this.litera = litera;
        this.catalog = catalog;
        this.materii = materii;
        this.elevi = elevi;
    }

    public List<Elev> getElevi() {
        return elevi;
    }

    public List<Materie> getMaterii() {
        return materii;
    }

    public Catalog getCatalog() {
        return catalog;
    }

    public String getNumar() {
        return numar;
    }

    public char getLitera() {
        return litera;
    }

    @Override
    public String toString(){
        return numar + litera;
    }
}
