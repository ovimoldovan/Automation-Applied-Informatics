/**
 * Created by ovi on 06/06/2017.
 */
public class Evaluare {
    private final Integer idMaterie;
    private final Integer nota;

    public Evaluare(Integer idMaterie, Integer nota) {
        this.idMaterie = idMaterie;
        this.nota = nota;
    }

    public Integer getIdMaterie() {
        return idMaterie;
    }

    public Integer getNota() {
        return nota;
    }
}
