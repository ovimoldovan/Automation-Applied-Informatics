package g30321.moldovan.ovidiu.e2;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JButton;
import java.awt.BorderLayout;
import javax.swing.JTextArea;

public class Counter {

	private JFrame frame;
	static int number = 0;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Counter window = new Counter();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Counter() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */

	private void initialize() {

		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JTextArea textArea = new JTextArea();
		frame.getContentPane().add(textArea, BorderLayout.CENTER);
		
		JButton btnPress = new JButton("Press");
		btnPress.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				number++;
				textArea.setText(String.valueOf(number));
			}
		});
		frame.getContentPane().add(btnPress, BorderLayout.NORTH);
		
		

		
		textArea.setText(String.valueOf(number));
		
	}
	


}
