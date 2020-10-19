import java.util.List;
import java.util.Map;

/**
 * Created by ovi on 06/06/2017.
 */
public class Catalog {
    private final Map<Integer, List<Evaluare>> note;
    Clasa clasa;

    public Catalog(Map<Integer, List<Evaluare>> note, Clasa clasa) {
        this.note = note;
        this.clasa = clasa;
    }

    public Map<Integer, List<Evaluare>> getNote() {
        return note;
    }


}
