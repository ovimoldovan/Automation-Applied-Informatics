/**
 * Created by ovi on 06/06/2017.
 */
public class Materie {
    private final Integer id;
    private final String nume;

    public Materie(Integer id, String nume) {
        this.id = id;
        this.nume = nume;
    }

    public String getNume() {
        return nume;
    }

    public Integer getId() {
        return id;
    }
}
