import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by ovi on 20/05/2017.
 */




public class main {
    static int isInt(String s){
        /*try{
            int num = Integer.parseInt(s);
            return 1;
        } catch (NumberFormatException e) {
            System.out.println("nu este numar");
            return 0;
        }*/ return 1;
    }
    public static void main(String[] args) throws IOException {
        FileReader in = null;
        BufferedReader br = null;
        int idElev = 0;
        int idClasa = 0;
        scoala.clasa[] clase = new scoala.clasa[12];



        try {
            in = new FileReader("src/input.txt");
            br = new BufferedReader(in);
            String linie;
            br.mark(1000);

            //int c;
            do{ br.reset();
                int an = Integer.parseInt((br.readLine()));
                char lit = br.readLine().charAt(0);
                clase[idClasa] = new scoala.clasa(an,lit,idClasa);
                do{
                    //br.reset();
                    String nume = br.readLine();
                    String prenume = br.readLine();
                    String mail = br.readLine();
                    clase[idClasa].adaugaElevi(nume, prenume, mail, idElev++ );
                    //br.mark(1000);
                }while(isInt(br.readLine()) == 1);
                br.mark(1000);
            }while ((br.readLine()) != null);
        }finally {
            if (in != null) {
                in.close();
                br.close();
            }
        }


        for(int i=0;i<idClasa;i++){
            System.out.println(idElev);
        }


    }

    }

