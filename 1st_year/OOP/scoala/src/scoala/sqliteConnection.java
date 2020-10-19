package scoala;

import java.sql.*;
import javax.swing.*;

public class sqliteConnection {
	Connection conn = null;
	public static Connection dbConnector(){
		try{
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager.getConnection("jdbc:sqlite:scoala.sqlite");
			//JOptionPane.showMessageDialog(null, "Conn success");
			return conn;
		}
		catch(Exception e){
			JOptionPane.showMessageDialog(null, "cant connect");
			return null;
		}
	}

}
