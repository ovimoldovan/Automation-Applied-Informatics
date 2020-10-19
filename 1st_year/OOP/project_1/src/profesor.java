/**
 * Created by ovi on 20/05/2017.
 */
public class profesor extends person {
    private int director = 0;

    profesor(String a, String b, String c) {
        super(a, b, c);
    }

    public int getDirector() {
        return director;
    }

    public void setDirector(int director) {
        this.director = 1;
    }


}
