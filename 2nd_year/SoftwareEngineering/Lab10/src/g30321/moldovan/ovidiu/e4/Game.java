package g30321.moldovan.ovidiu.e4;

import java.awt.EventQueue;

import javax.swing.JFrame;
import java.awt.GridLayout;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.JLabel;

public class Game {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Game window = new Game();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		//debugging
		//System.out.println(getValue() + " " + getAndSetValue() + " " + getValue()); 
		
		//initialize table matrix; initializing with a number because if every value is null, the checkWin() method will return true
		int k = 0;
		for(int i = 0; i<=2; i++)
			for(int j = 0; j<=2; j++)
				table[i][j] = String.valueOf(k++);
		
		printTable();
	
	}

	/**
	 * Create the application.
	 */
	public Game() {
		initialize();
	}
	// the current value for the game
	static int status = 0;
	static String[][] table = new String[3][3];
	//static boolean won = false;
	static int round;
	
	static String getValue(){
		return (status%2==0) ? "X" : "0";
	}
	static String getAndSetValue(){
		return (status++%2==0) ? "X" : "0";
	}
	
	static String getNewValue(){
		return (++status%2==0) ? "X" : "0";
	}

	public void setButton(JButton b, int x, int y){
		
		if(checkWin()==false && round<9){
		table[x][y] = getValue();
		b.setText(getAndSetValue());
		b.setEnabled(false);
		printTable();
		}
		if(checkWin()==true){
			this.label.setText(getNewValue() + " has won! GAME OVER");
		}
		
		//check for tie
		round++;
		if(round==9){
			this.label.setText("TIE. GAME OVER");
		}
		
	}
	
	public static void printTable(){
		for(int i = 0; i<=2;i++)
		{
		for(int j = 0; j<=2; j++)
			System.out.print(table[i][j] + " ");
		System.out.print("\n");
		}
	}
	
	public boolean checkWin(){
		
		//horizontal cases
		for(int i = 0; i<=2; i++)
			if(table[i][0].equals(table[i][1]) && table[i][0].equals(table[i][2])) return true;
		
		//vertical cases
		for(int i = 0; i<=2; i++)
			if(table[0][i].equals(table[1][i]) && table[0][i].equals(table[2][i])) return true;
		
		//first diagonal case
		if(table[0][0].equals(table[1][1]) && table[1][1].equals(table[2][2])) return true;
		
		//second diagonal case
		if(table[0][2].equals(table[1][1]) && table[1][1].equals(table[2][0])) return true;
		
		
		return false;
	}
	
	/**
	 * Initialize the contents of the frame.
	 */
	
	JLabel label = new JLabel(" ");
	
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JButton button = new JButton("");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button, 0, 0);
			}
		});
		
		JButton button_1 = new JButton("");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_1, 0, 1);
			}
		});
		
		JButton button_2 = new JButton("");
		button_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_2, 0, 2);
			}
		});
		
		JButton button_3 = new JButton("");
		button_3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_3, 1, 0);
			}
		});
		
		JButton button_4 = new JButton("");
		button_4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_4, 1, 1);
			}
		});
		
		JButton button_5 = new JButton("");
		button_5.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_5, 1, 2);
			}
		});
		
		JButton button_6 = new JButton("");
		button_6.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_6, 2, 0);
			}
		});
		
		JButton button_7 = new JButton("");
		button_7.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_7, 2, 1);
			}
		});
		
		JButton button_8 = new JButton("");
		button_8.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button_8, 2, 2);
			}
		});
		
		JLabel lblTicTacToe = new JLabel("Tic Tac Toe");
		
		
		
		
		
		GroupLayout groupLayout = new GroupLayout(frame.getContentPane());
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(104)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addComponent(button)
								.addComponent(button_3))
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addComponent(button_1)
								.addComponent(button_4)
								.addComponent(lblTicTacToe))
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addComponent(button_5)
								.addComponent(button_2)))
						.addGroup(groupLayout.createSequentialGroup()
							.addComponent(button_6)
							.addPreferredGap(ComponentPlacement.RELATED)
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addComponent(label)
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(button_7)
									.addPreferredGap(ComponentPlacement.RELATED)
									.addComponent(button_8)))))
					.addContainerGap(109, Short.MAX_VALUE))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(54)
					.addComponent(lblTicTacToe)
					.addGap(18)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(button)
						.addComponent(button_1)
						.addComponent(button_2))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(button_3)
						.addComponent(button_4)
						.addComponent(button_5))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(button_6)
						.addComponent(button_7)
						.addComponent(button_8))
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addComponent(label)
					.addContainerGap(63, Short.MAX_VALUE))
		);
		frame.getContentPane().setLayout(groupLayout);
	}
}
