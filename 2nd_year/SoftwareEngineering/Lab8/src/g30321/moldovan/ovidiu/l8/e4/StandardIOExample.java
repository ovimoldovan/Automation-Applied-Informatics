package g30321.moldovan.ovidiu.l8.e4;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;

public class StandardIOExample {

      static String sortChars(String s){
            char[] a = s.toCharArray();
            Arrays.sort(a);
            return new String(a);
      }

      public static void main(String[] args) {
            try{
           BufferedReader fluxIn = new BufferedReader(new InputStreamReader(System.in));
           String line = "";
                 do{
                   System.out.print(">");
                   line = fluxIn.readLine();
                   System.out.println("result:"+sortChars(line));
                 }while(line.indexOf("end")==-1);   
            }catch(Exception e){
                  e.printStackTrace();
                  System.err.println("Error :"+e.getMessage());
            }
      }
}