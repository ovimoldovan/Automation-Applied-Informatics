package scoala;

import java.awt.EventQueue;

import java.sql.*;
import javax.swing.*;

import java.awt.BorderLayout;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Login {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Login window = new Login();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	//connection 
	
	Connection connection = null;
	private JTextField textFieldUser;
	private JPasswordField passwordField;

	/**
	 * Create the application.
	 */
	public Login() {
		initialize();
		Connection connection = sqliteConnection.dbConnector();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Username");
		lblNewLabel.setBounds(74, 82, 96, 16);
		frame.getContentPane().add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("Password");
		lblNewLabel_1.setBounds(74, 126, 61, 16);
		frame.getContentPane().add(lblNewLabel_1);
		
		textFieldUser = new JTextField();
		textFieldUser.setBounds(203, 77, 130, 26);
		frame.getContentPane().add(textFieldUser);
		textFieldUser.setColumns(10);
		

		
		passwordField = new JPasswordField();
		passwordField.setBounds(203, 121, 130, 26);
		frame.getContentPane().add(passwordField);
		
		JButton btnLogin = new JButton("Login");
		btnLogin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try{
					//String query = "";
					Connection conn2 = sqliteConnection.dbConnector();
					PreparedStatement pst = conn2.prepareStatement("select * from elevi where email=? and parola=? ");
					pst.setString(1, textFieldUser.getText());
					pst.setString(2, passwordField.getText());
					
					int count=0;
					ResultSet rs = pst.executeQuery();
					while(rs.next()){
						count++;
					}
					if(count==1){
						JOptionPane.showMessageDialog(null, "Email and password are correct");
					}
					else if(count>1){
						JOptionPane.showMessageDialog(null, "Duplicate user and password");
					}
					else {
						JOptionPane.showMessageDialog(null, "Email and password are NOT correct");
					}
					//rs.close();
					//pst.close();
				}
				catch(Exception ee){
					JOptionPane.showMessageDialog(null, ee);
				}
			}
		});
		
		btnLogin.setBounds(160, 195, 117, 29);
		frame.getContentPane().add(btnLogin);
		

	}
}
