package g30321.moldovan.ovidiu.e3;

import java.awt.*;
import java.awt.event.*;
import java.io.*;

import javax.swing.*;


public class Editor extends JFrame
{
      JMenuBar mb;
      JMenu f;
      JMenu t;
      JMenuItem o,e;
      JTextArea ta;

      Editor()
      {
            mb = new JMenuBar();
            f = new JMenu("File");


            o = new JMenuItem("Open");
            e = new JMenuItem("Exit");

            
            o.addActionListener(new A());
            e.addActionListener(new A());


            mb.add(f);

            f.add(o);
            f.add(e);

            setJMenuBar(mb);

            ta = new JTextArea();
            add(ta);

            setSize(500,400);
            setVisible(true);
      }






      void open(String f)
      {
            try
            {
            ta.setText("");
            BufferedReader bf =
                  new BufferedReader(
                        new FileReader(new File(f)));

            String l = "";
            l = bf.readLine();
            while (l!=null)
            {
                  ta.append(l+"\n");
                  l = bf.readLine();
            }
            }catch(Exception e){
            	System.out.print("No test file found");
            }
      }

      class A implements ActionListener
      {
            public void actionPerformed(ActionEvent e)
            {
            	String t = ((JMenuItem)e.getSource()).getLabel(); 
                  if (t.equals("Open"))
                  {
                   open("test");
                  }
                  if(t.equals("Exit")){
                	  Editor.this.dispose();
                  }

            }
      }

      public static void main(String args[])
      {
            new Editor();
      }
}