package g30321.moldovan.ovidiu.l8.e4;

import java.io.*;
class Redirecter {
      public static void main(String[] args) {
            try {
                  BufferedInputStream in = new BufferedInputStream(
                        new FileInputStream(".project"));
                  PrintStream out = new PrintStream(new BufferedOutputStream(
                        new FileOutputStream("test.out")));
                  System.setIn(in);
                  System.setOut(out);
                  System.setErr(out);
                  BufferedReader br = new BufferedReader(
                              new InputStreamReader(System.in));
                  String s;
                  while((s = br.readLine()) != null)
                        System.out.println(s);
                  out.close();
            } catch(IOException e) {

                  e.printStackTrace();
            }
            
            
      }
}