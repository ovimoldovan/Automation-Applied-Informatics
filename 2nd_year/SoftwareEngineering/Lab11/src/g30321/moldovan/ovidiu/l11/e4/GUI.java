package g30321.moldovan.ovidiu.l11.e4;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


	public class GUI extends JFrame implements ActionListener{
	    Incrementer incrementer;
	    JButton resetButton;
	    JButton startButton;
	    public GUI(Incrementer incrementer) {
	        setTitle("Timer");
	        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
	        setLayout(new GridLayout(3,1));
	        setSize(300,300);
	        setVisible(true);

	        this.incrementer = incrementer;
	        add(incrementer.timerLabel);

	        resetButton = new JButton("Reset");
	        resetButton.addActionListener(this);
	        add(resetButton);
	        
	        startButton = new JButton("Start");
	        startButton.addActionListener(this);
	        add(startButton);
	    }


	    public static void main(String[] args) {
	        Incrementer incrementer = new Incrementer();
	        GUI gui = new GUI(incrementer);
	        //incrementer.start();
	    }

	    @Override
	    public void actionPerformed(ActionEvent e) {
	        String source = (String) ((JButton)(e.getSource())).getText();
	        if(source.equals("Reset")) {
	            incrementer.timerValue=0;
	        }
	        if(source.equals("Start")){
	        	incrementer.start();
	        }
	    }
	}
