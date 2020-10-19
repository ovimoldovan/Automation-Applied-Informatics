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

public class Game2 {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Game2 window = new Game2();
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
	public Game2() {
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

	public void setButton(JButton b, int x, int y){
		
		if(checkWin()==false && round<9){
		table[x][y] = getValue();
		b.setText(getAndSetValue());
		b.setEnabled(false);
		printTable();
		}
		if(checkWin()==true){
			this.label.setText(getValue() + " has won! GAME OVER");
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
		
		JButton[] button = new JButton[9];
		for(int i = 0; i < 9; i++)
			button[i] = new JButton(" ");
		
		for(int i = 0; i<9; i++){
		button[0].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[0], 0, 0);
			}
		});
		}
		
		
		button[1].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[1], 0, 1);
			}
		});
		
		
		button[2].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[2], 0, 2);
			}
		});
		
		
		button[3].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[3], 1, 0);
			}
		});
		
		
		button[4].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[4], 1, 1);
			}
		});
		
		
		button[5].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[5], 1, 2);
			}
		});
		
		
		button[6].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[6], 2, 0);
			}
		});
		
		
		button[7].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[7], 2, 1);
			}
		});
		
		
		button[8].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				setButton(button[8], 2, 2);
			}
		});
		
		JLabel lblTicTacToe = new JLabel("Tic Tac Toe");
		
		JButton btnNewGame = new JButton("New game");
		btnNewGame.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//clear the matrix
				for(int i = 0; i<=2; i++)
					for(int j = 0; j<=2; j++)
						//table[i][j] = String.valueOf(k++);
				
				printTable();
			}
		});
		
		
		
		
		
		GroupLayout groupLayout = new GroupLayout(frame.getContentPane());
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addGap(104)
							.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
								.addGroup(groupLayout.createSequentialGroup()
									.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addComponent(button[0])
										.addComponent(button[3]))
									.addPreferredGap(ComponentPlacement.RELATED)
									.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addComponent(button[1])
										.addComponent(button[4])
										.addComponent(lblTicTacToe))
									.addPreferredGap(ComponentPlacement.RELATED)
									.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addComponent(button[5])
										.addComponent(button[2])))
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(button[6])
									.addPreferredGap(ComponentPlacement.RELATED)
									.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
										.addComponent(label)
										.addGroup(groupLayout.createSequentialGroup()
											.addComponent(button[7])
											.addPreferredGap(ComponentPlacement.RELATED)
											.addComponent(button[8]))))))
						.addGroup(groupLayout.createSequentialGroup()
							.addGap(23)
							.addComponent(btnNewGame)))
					.addContainerGap(109, Short.MAX_VALUE))
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGap(54)
					.addComponent(lblTicTacToe)
					.addGap(18)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(button[0])
						.addComponent(button[1])
						.addComponent(button[2]))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(button[3])
						.addComponent(button[4])
						.addComponent(button[5]))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(button[6])
						.addComponent(button[7])
						.addComponent(button[8]))
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addComponent(label)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addComponent(btnNewGame)
					.addContainerGap(22, Short.MAX_VALUE))
		);
		frame.getContentPane().setLayout(groupLayout);
	}
}
