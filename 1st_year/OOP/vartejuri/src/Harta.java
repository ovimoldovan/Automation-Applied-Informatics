/**
 * Created by ovi on 10/07/2017.
 */
public class Harta {
    private final int x;
    private final int y;
    private char[][] h;

    public Harta(int x, int y) {
        this.x = x;
        this.y = y;
        h = new char[x+1][y];
        createMap(x,y);
    }


    public void createMap(int x, int y) {
        for (int i = 0; i < x; i++) {
            for (int j = 0; j < y; j++) {
                h[i][j] = '.';
            }
        }
        for(int i=0;i<y;i++)
            if(i%5!=0) h[x][i] = '=';
            else h[x][i] = 'B';
    }

    public void showMap(){
        for(int i = 0; i <= x; i++){
            for(int j = 0; j < y; j++) System.out.print(h[i][j]);
            System.out.print("\n");
        }
    }

    

}
