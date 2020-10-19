import java.io.*;
import java.util.*;

/**
 * Created by ovi on 06/06/2017.
 */
public class Main {
    public static void main(String[] args) throws IOException {

        //citire din fisier

        Scanner in = new Scanner(new File("src/input.txt"));
        int classId = 0;

        String line = in.nextLine(); //SCOALA
        Scoala scoala = new Scoala(in.nextLine(), new ArrayList<>(), new ArrayList<>(), new ArrayList<>());

        String lineClase = in.nextLine(); //CLASE
        lineClase = in.nextLine();

        while(lineClase.equals("clasa")) {
            Catalog catalogNou = new Catalog(new HashMap<>(), null);
            Clasa clasaNoua = new Clasa(++classId, in.nextLine(), in.nextLine().charAt(0), catalogNou, new ArrayList<>(), new ArrayList<>());

            String lineMaterie = in.nextLine();
            lineMaterie = in.nextLine();

            while(lineMaterie.equals("materie")) {
                clasaNoua.getMaterii().add(new Materie(new Integer(in.nextLine()), in.nextLine()));
                lineMaterie = in.nextLine();
            }

            String lineElevi = in.nextLine();

            while(lineElevi.equals("elev")) {
                Elev nou = new Elev(in.nextLine(), in.nextLine(), in.nextLine(), in.nextLine(), new Integer(in.nextLine()), clasaNoua);
                clasaNoua.getElevi().add(nou);
                scoala.getElevi().add(nou);

                String lineNote = in.nextLine();
                lineNote = in.nextLine();

                while(lineNote.equals("nota")) {
                    if (!catalogNou.getNote().containsKey(nou.getId())) {
                        catalogNou.getNote().put(nou.getId(), new ArrayList<>());
                    }
                    catalogNou.getNote().get(nou.getId()).add(new Evaluare(new Integer(in.nextLine()), new Integer(in.nextLine())));
                    lineNote = in.nextLine();
                }
                lineElevi = lineNote;
            }

            catalogNou.clasa = clasaNoua;
            scoala.getClase().add(clasaNoua);
            scoala.addMapping(classId, clasaNoua);
            lineClase = lineElevi;
        }

        Director director = new Director(in.nextLine(), in.nextLine(), in.nextLine(), in.nextLine(), scoala.getIdToClass().get(new Integer(in.nextLine())), scoala);

        String lineProf = in.nextLine();
        lineProf = in.nextLine();

        while(lineProf.equals("prof")) {
            scoala.getProfesori().add(new Profesor(in.nextLine(), in.nextLine(), in.nextLine(), in.nextLine(), scoala.getIdToClass().get(new Integer(in.nextLine()))));
            try {
                lineProf = in.nextLine();
            } catch (Exception e) {
                break;
            }
        }

        //modificare
        
        scoala.getProfesori().get(0).adaugaNota(new Evaluare(1, 7), scoala.getElevi().get(2), scoala.getElevi().get(2).getClasa().getCatalog());


        //salvare in fisierul initial
        Writer out = new FileWriter( "src/input.txt");
        
        out.write("SCOALA\n" + scoala.getNume() +"\n");//scoala
        out.write("CLASE" + "\n");
        for(Clasa c : scoala.getClase()) {
            out.write("clasa\n");
            out.write(c.getNumar() + "\n" + c.getLitera() + "\n");
            out.write("MATERII\n");
            for(Materie m : c.getMaterii()) {
                out.write("materie\n");
                out.write(m.getId() + "\n" + m.getNume() + "\n");
            }
            out.write("ELEVI\n");
            for(Elev e : c.getElevi()) {
                out.write("elev\n");
                out.write(e.getCnp() + "\n" + e.getNume() + "\n" + e.getPrenume() + "\n" + e.getEmail() + "\n" + e.getId() + "\n");
                out.write("NOTE\n");

                Map<Integer, List<Evaluare>> note = c.getCatalog().getNote();

                if (note.containsKey(e.getId())) {
                    for (Evaluare eval : c.getCatalog().getNote().get(e.getId())) {
                        out.write("nota\n");
                        out.write(eval.getIdMaterie() + "\n" + eval.getNota() + "\n");
                    }
                }
            }
        }
        out.write("DIRECTOR\n");
        out.write(director.getCnp() + "\n" + director.getNume() + "\n" + director.getPrenume() + "\n" + director.getEmail() + "\n" + scoala.getClassToId().get(director.clasa) + "\n");
        out.write("PROFESORI\n");
        for(Profesor p : scoala.getProfesori()){
            out.write("prof\n");
            out.write(p.getCnp() + "\n" + p.getNume() + "\n" + p.getPrenume() + "\n" + p.getEmail() + "\n" + scoala.getClassToId().get(p.clasa) + "\n");
        }

        out.close();
    }
}
