/**
 * Created by ovi on 06/06/2017.
 */
public class Persoana {

    protected final String cnp;
    protected final String nume;
    protected final String prenume;
    protected final String email;

    public Persoana(String cnp, String nume, String prenume, String email) {
        this.cnp = cnp;
        this.nume = nume;
        this.prenume = prenume;
        this.email = email;
    }

    public String getNume() {
        return nume;
    }

    public String getCnp() {
        return cnp;
    }

    public String getPrenume() {
        return prenume;
    }

    public String getEmail() {
        return email;
    }
}
