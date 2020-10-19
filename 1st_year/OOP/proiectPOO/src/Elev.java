/**
 * Created by ovi on 07/07/2017.
 */
public class Elev extends Persoana {
    private final Integer id;
    private final Clasa clasa;

    public Elev(String cnp, String nume, String prenume, String email, Integer id, Clasa clasa) {
        super(cnp, nume, prenume, email);
        assert(1 <= id && id <= 10000): "Id invalid";
        this.id = id;
        this.clasa = clasa;
    }

    public Integer getId() {
        return id;
    }

    public Clasa getClasa() {
        return clasa;
    }

    @Override
    public boolean equals(Object other) {
        if (!(other instanceof Elev)) {
            return false;
        }

        Elev cast = (Elev) other;

        return this.id.equals(cast.id);
    }

    @Override
    public int hashCode() {
        return this.id;
    }
}
